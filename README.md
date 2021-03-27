# CI 例

## 目次

- [実行環境](#実行環境)
- [サーバー起動](#サーバー起動)
- [ビルド](#ビルド)

## 実行環境

- 必要な言語・ツール
  - asdf
  - yarn
- 以下のコマンドを実行し、必要なパッケージをインストールする

```bash
asdf plugin add \
    nodejs \
    yarn
asdf install
pip install --upgrade pip
pip install -r requirements.txt
asdf reshim python
yarn
```

## 静的解析

```bash
pre-commit run --all-files
pre-commit install
```

## サーバー起動

- 以下のコマンドで Web サーバーを起動する

```bash
$ yarn start
yarn run v1.22.2
$ webpack-dev-server --mode development
ℹ ｢wds｣: Project is running at http://localhost:3000/
ℹ ｢wds｣: webpack output is served from /
ℹ ｢wds｣: Content not from webpack is served from /tech-docs/articles/nodejs/webpack/dist
ℹ ｢wds｣: 404s will fallback to /index.html
ℹ ｢wdm｣: wait until bundle finished: /
ℹ ｢wdm｣: Compiled successfully.
```

- 起動後、自動的にブラウザで <http://localhost:3000/> が開かれる

## ビルド

- 以下のコマンドで本番用にビルドする

```bash
$ yarn build
yarn run v1.22.2
$ webpack --mode production
Hash: 35a235a7e43824b4101b
Version: webpack 4.43.0
Time: 2297ms
Built at: 2020/05/07 0:40:15
        Asset       Size  Chunks             Chunk Names
css/style.css   99 bytes       0  [emitted]  main
   index.html  212 bytes          [emitted]
      main.js   1.02 KiB       0  [emitted]  main
Entrypoint main = css/style.css main.js

...

✨  Done in 5.53s.
```

- dist 配下にビルドされたコードが出力される
