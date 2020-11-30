import * as functions from 'firebase-functions';
import * as admin from 'firebase-admin';
import fetch from 'node-fetch';
import { URLSearchParams } from 'url';
import * as dayjs from 'dayjs';
import * as utc from 'dayjs/plugin/utc';
import * as timezone from 'dayjs/plugin/timezone';

const app = admin.initializeApp()
const defaultTimeZone = 'Asia/Tokyo'
const defaultRegion = 'asia-northeast1'

dayjs.locale('ja')
dayjs.extend(utc)
dayjs.extend(timezone)

dayjs.tz.setDefault(defaultTimeZone)

functions.logger.info('app initialized !', app.name);

// Start writing Firebase Functions
// https://firebase.google.com/docs/functions/typescript

const saveLogs = async (userId: string, date: string, data: any) => {
    // FIXME: batch update
    const userRef = admin.firestore()
        .collection('users')
        .doc(userId)
    await userRef.set({ 'lastUpdate': admin.firestore.FieldValue.serverTimestamp() }, { merge: true })
    const ref = userRef.collection('logs')
        .doc(date)
    functions.logger.info(`ref: ${ref.path}`)
    return ref.set({ ...data, 'createdAt': admin.firestore.FieldValue.serverTimestamp() })
};

const scrapingQiita = async (qiitaId: string, bearer: string) => {
    const response = await fetch(`https://asia-northeast1-posts-index.cloudfunctions.net/v1-qiita?user=${qiitaId}`)
    if (!response.ok) {
        functions.logger.error(`${response.status} ${response.statusText}`)
        return null
    }
    const data = await response.clone().json()
    functions.logger.info(`Qiita Fetch Succeed!`, await response.text())
    return data
}

const scrapingNote = async (noteId: string) => {
    const response = await fetch(`https://asia-northeast1-posts-index.cloudfunctions.net/v1-note?user=${noteId}`)
    if (!response.ok) {
        functions.logger.error(`${response.status} ${response.statusText}`)
        return null
    }
    const data = await response.clone().json()
    functions.logger.info(`note.mu Fetch Succeed!`, await response.text())
    return data
}
const scrapingZenn = async (zennId: string) => {
    const response = await fetch(`https://asia-northeast1-posts-index.cloudfunctions.net/v1-zenn?user=${zennId}`)
    if (!response.ok) {
        functions.logger.error(`${response.status} ${response.statusText}`)
        return null
    }
    const data = await response.clone().json()
    functions.logger.info(`note.mu Fetch Succeed!`, await response.text())
    return data
}

const scrapingTwitter = async (twitterId: string) => {
    // Set Twitter BEARER: firebase functions:config:set twitter.bearer=...
    const bearer = functions.config().twitter.bearer
    // SEE: https://developer.twitter.com/en/docs/twitter-api/users/lookup/api-reference/get-users-by-username-username
    const query = new URLSearchParams({ 'user.fields': 'public_metrics' })
    const url = `https://api.twitter.com/2/users/by/username/${twitterId}?${query.toString()}`
    functions.logger.info(`Twitter Request URL: ${url} Bearer: ${bearer}`)
    const response = await fetch(url, {
        headers: {
            'Authorization': `Bearer ${bearer}`
        }
    })
    if (!response.ok) {
        throw new Error(`${response.status} ${response.statusText}`)
    }
    const data = await response.clone().json()
    functions.logger.info(`Twitter Fetch Succeed!`, await response.text())
    return data
}

/// ユーザーをすべて探索
const fetchUsers = () => {
    return admin.firestore()
        .collection('users')
        .get()
}

/// すべてのユーザーのcronを順番に叩く
const scraping = async () => {
    const snapshots = await fetchUsers()
    snapshots.docs.forEach(async (snapshot) => {
        const user = snapshot.data()

        functions.logger.info(`Start scraping! user: ${user}`)

        // FIXME: JSON deserializer
        const qiitaId = user.qiitaId
        const qiitaBearer = user.qiitaBearer
        const noteId = user.noteId
        const twitterId = user.twitterId
        const zennId = user.zennId

        const data = {
            qiita: (qiitaId && qiitaBearer) ? await scrapingQiita(qiitaId, qiitaBearer) : null,
            note: (noteId) ? await scrapingNote(noteId) : null,
            twitter: (twitterId) ? (await scrapingTwitter(twitterId))['data'] : null,
            zenn: (zennId) ? (await scrapingZenn(zennId)) : null,
        }

        const date = dayjs().tz().format('YYYY-MM-DD')
        await saveLogs(snapshot.id, date, data)
        functions.logger.info(`Save to Firestore! [${date}] uid: ${snapshot.id}`, { structuredData: true });
    })
}

// 月曜日25時に収集開始
export const scrapingCrontab = functions.region(defaultRegion).pubsub.schedule('0 1 * * 1')
    .timeZone(defaultTimeZone)
    .onRun(async (context) => {
        await scraping()
        return null;
    });
