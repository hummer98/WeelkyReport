import {
  apps,
  clearFirestoreData,
  initializeTestApp,
  initializeAdminApp,
  assertFails,
  assertSucceeds,
  loadFirestoreRules
} from "@firebase/rules-unit-testing";
import type firebase from 'firebase/app'
import * as fs from "fs";

const PROJECT_ID = "weeklyreport-63ab1";
const RULES_PATH = "firestore.rules";

// 認証付きのFreistore appを作成する
const createAuthApp = (auth?: object) => {
  return initializeTestApp({ projectId: PROJECT_ID, auth: auth })
    .firestore();
};

const createUnAuthApp = () => {
  return initializeTestApp({ projectId: PROJECT_ID })
    .firestore();
};

// 管理者権限で操作できるFreistore appを作成する
const createAdminApp = () => {
  return initializeAdminApp({ projectId: PROJECT_ID }).firestore();
};

// user情報への参照を作る
const usersRef = (db: firebase.firestore.Firestore) => db.collection("users");
const logsRef = (db: firebase.firestore.Firestore, userId: string) => db.collection(`users/${userId}/logs`)

describe("Firestoreセキュリティルール", () => {
  // ルールファイルの読み込み
  beforeAll(async () => {
    const rules = fs.readFileSync(RULES_PATH, "utf8")
    await loadFirestoreRules({
      projectId: PROJECT_ID,
      rules: rules
    });
  });

  // Firestoreデータのクリーンアップ
  afterEach(async () => {
    await clearFirestoreData({ projectId: PROJECT_ID });
  });

  // Firestoreアプリの削除
  afterAll(async () => {
    await Promise.all(apps().map(app => app.delete()));
  });

  // Authorization
  test("ゲストはusersに書き込めない/読めない", async () => {
    const db = createUnAuthApp()
    const user = usersRef(db).doc("test")
    await assertFails(user.set({ name: "太郎" }));
    await assertFails(user.get());
  })

  test("認証ユーザはusers/${uid}に書き込める/読める", async () => {
    const db = createAuthApp({ uid: "myid" })
    const user = usersRef(db).doc("myid")
    await assertSucceeds(user.set(validateUserJSON));
    await assertSucceeds(user.get())
  });

  test("認証ユーザはusers/otheridに書き込めない/読めない", async () => {
    const db = createAuthApp({ uid: "myid" })
    const user = usersRef(db).doc("otherid")
    await assertFails(user.set(validateUserJSON));
    await assertFails(user.get())
  });

  /// users/{userId}/logs のルール
  test("認証ユーザはusers/myid/logsに書き込める/読める", async () => {
    const uid = "myid"
    const db = createAuthApp({ uid: uid })
    const logs = logsRef(db, uid).doc();
    await assertSucceeds(logs.set(validateLogJSON));
    await assertSucceeds(logs.get())
  });

  test("認証ユーザはusers/otherid/logsに書き込めない/読めない", async () => {
    const uid = "myid"
    const db = createAuthApp({ uid: uid })
    const logs = logsRef(db, "otherid").doc();
    await assertFails(logs.set(validateLogJSON));
    await assertFails(logs.get())
  });

  // Key-Value Validation

  const validateLogJSON = {
    'qiita': {},
    'twitter': {},
    'note': {},
    'zenn': {},
    'createdAt': new Date(),
  }

  const invalidateLogJSON = {
    'piyo': {}
  }

  const validateUserJSON = {
    'qiitaId': "qiitaId",
    'noteId': "nodeId",
    'twitterId': "twiiterId",
    'zennId': "zennid",
  }

  const invalidJSON = {
    'qiitaId': "qiitaId",
    'noteId': "nodeId",
    'twitterId': "twiiterId",
  }

  test("認証ユーザはusers/{myid}に書き込み時に特定のキーを書き込める", async () => {
    const db = createAuthApp({ uid: "myid" })
    const user = usersRef(db).doc("myid")
    await assertSucceeds(user.set(validateUserJSON));
  });

  test("認証ユーザはusers/{myid}に書き込み時に特定のキー以外は書き込めない", async () => {
    const db = createAuthApp({ uid: "myid" })
    const user = usersRef(db).doc("myid")
    await assertFails(user.set(invalidJSON));
  });

  test("認証ユーザはusers/{myid}/logs/{date}に書き込み時に特定のキーを書き込める", async () => {
    const uid = "myid"
    const db = createAuthApp({ uid: uid })
    const user = logsRef(db, uid).doc()
    await assertSucceeds(user.set(validateLogJSON));
  });

  test("認証ユーザはusers/{myid}/logs/{date}に書き込み時に特定のキー以外は書き込めない", async () => {
    const uid = "myid"
    const db = createAuthApp({ uid: uid })
    const user = logsRef(db, uid).doc()
    await assertFails(user.set(invalidateLogJSON));
  });

});