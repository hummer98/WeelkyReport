import * as firebase from "@firebase/testing";
import { FieldValue } from "@google-cloud/firestore";
import * as fs from "fs";

const PROJECT_ID = "weeklyreport-63ab1";
const RULES_PATH = "firestore.rules";

// 認証付きのFreistore appを作成する
const createAuthApp = (auth?: object): firebase.firestore.Firestore => {
  return firebase.initializeTestApp({ projectId: PROJECT_ID, auth: auth })
    .firestore();
};

const createUnAuthApp = (): firebase.firestore.Firestore => {
  return firebase.initializeTestApp({ projectId: PROJECT_ID })
    .firestore();
};

// 管理者権限で操作できるFreistore appを作成する
const createAdminApp = (): firebase.firestore.Firestore => {
  return firebase.initializeAdminApp({ projectId: PROJECT_ID }).firestore();
};

// user情報への参照を作る
const usersRef = (db: firebase.firestore.Firestore) => db.collection("users");
const logsRef = (db: firebase.firestore.Firestore, userId: string) => db.collection(`users/${userId}/logs`)

describe("Firestoreセキュリティルール", () => {
  // ルールファイルの読み込み
  beforeAll(async () => {
    const rules = fs.readFileSync(RULES_PATH, "utf8")
    await firebase.loadFirestoreRules({
      projectId: PROJECT_ID,
      rules: rules
    });
  });

  // Firestoreデータのクリーンアップ
  afterEach(async () => {
    await firebase.clearFirestoreData({ projectId: PROJECT_ID });
  });

  // Firestoreアプリの削除
  afterAll(async () => {
    await Promise.all(firebase.apps().map(app => app.delete()));
  });
  
  // Authorization
  test("ゲストはusersに書き込めない/読めない", async () => {
    const db = createUnAuthApp()
    const user = usersRef(db).doc("test")
    await firebase.assertFails(user.set({ name: "太郎" }));
    await firebase.assertFails(user.get());
  })

  test("認証ユーザはusers/${uid}に書き込める/読める", async () => {
    const db = createAuthApp({ uid: "myid" })
    const user = usersRef(db).doc("myid")
    await firebase.assertSucceeds(user.set(validateUserJSON));
    await firebase.assertSucceeds(user.get())
  });

  test("認証ユーザはusers/otheridに書き込めない/読めない", async () => {
    const db = createAuthApp({ uid: "myid" })
    const user = usersRef(db).doc("otherid")
    await firebase.assertFails(user.set(validateUserJSON));
    await firebase.assertFails(user.get())
  });

  /// users/{userId}/logs のルール
  test("認証ユーザはusers/myid/logsに書き込める/読める", async () => {
    const uid = "myid"
    const db = createAuthApp({ uid: uid })
    const logs = logsRef(db, uid).doc();
    await firebase.assertSucceeds(logs.set(validateLogJSON));
    await firebase.assertSucceeds(logs.get())
  });

  test("認証ユーザはusers/otherid/logsに書き込めない/読めない", async () => {
    const uid = "myid"
    const db = createAuthApp({ uid: uid })
    const logs = logsRef(db, "otherid").doc();
    await firebase.assertFails(logs.set(validateLogJSON));
    await firebase.assertFails(logs.get())
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
    await firebase.assertSucceeds(user.set(validateUserJSON));
  });

  test("認証ユーザはusers/{myid}に書き込み時に特定のキー以外は書き込めない", async () => {
    const db = createAuthApp({ uid: "myid" })
    const user = usersRef(db).doc("myid")
    await firebase.assertFails(user.set(invalidJSON));
  });

  test("認証ユーザはusers/{myid}/logs/{date}に書き込み時に特定のキーを書き込める", async () => {
    const uid = "myid"
    const db = createAuthApp({ uid: uid})
    const user = logsRef(db, uid).doc()
    await firebase.assertSucceeds(user.set(validateLogJSON));
  });

  test("認証ユーザはusers/{myid}/logs/{date}に書き込み時に特定のキー以外は書き込めない", async () => {
    const uid = "myid"
    const db = createAuthApp({ uid: uid})
    const user = logsRef(db, uid).doc()
    await firebase.assertFails(user.set(invalidateLogJSON));
  });
  
});