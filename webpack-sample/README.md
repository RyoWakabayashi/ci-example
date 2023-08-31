# webpack 例

## 目次

- [実行環境](#実行環境)
- [サーバー起動](#サーバー起動)
- [ビルド](#ビルド)

## 実行環境

以下のコマンドを実行し、必要なパッケージをインストールする

```bash
npm install
```

## サーバー起動

以下のコマンドで Web サーバーを起動する

```bash
$ npm start

> ci-example_webpack-example@1.0.4 start
> webpack serve --mode development

<i> [webpack-dev-server] Project is running at:
<i> [webpack-dev-server] Loopback: http://localhost:3100/, http://127.0.0.1:3100/
...
webpack 5.88.2 compiled successfully in 578 ms
```

起動後、自動的にブラウザで <http://localhost:3000/> が開かれる

## ビルド

以下のコマンドで本番用にビルドする

```bash
$ npm run build

> ci-example_webpack-example@1.0.4 build
> webpack --mode production

asset index.html 249 bytes [emitted]
asset main.js 99 bytes [emitted] [minimized] (name: main)
asset css/style.css 97 bytes [emitted] (name: main)
...
webpack 5.88.2 compiled successfully in 427 ms
```

dist 配下にビルドされたコードが出力される
