* Try＆エラーをJupyter labでやっていた
* `jupyter lab`で起動する


## 環境
* node v12.16.2

## ローカルでの開発準備
* `yarn`でパッケージをインストール
* `firebase functions:config:get > .runtimeconfig.json`でfunctionsの環境変数をダウンロード
* `/data/`にfirestoreエミュレータ用の初期データを置く
* `firestore --import=./data emulators:start `でauth, functions, firestore, pubsubのすべてのエミュレータが起動
* 別のコンソールで`functions`に移動
* `yarn watch`でfunctionsの自動リビルドを仕込む
* さらに別のコンソールでVSCodeを開く→`code .`

## 開発メモ

### firestoreのエミュレータ用データのexport方法
* 適当にfunctions.httpsでデータを作る
```ts
export const hoge = functions.region(defaultRegion).https.onRequest(async (request, response) => {
    await admin.firestore().collection('users').add({
        'data': 'piyo',
    })
    response.send(`successed.`)
})
```
* `firebase emulators:export ./data/`でエクスポート