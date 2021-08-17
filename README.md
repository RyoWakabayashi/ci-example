# CI 例

## 目次

- [実行環境](#実行環境)
- [静的解析](#静的解析)
- [サーバー起動](#サーバー起動)
- [ビルド](#ビルド)

## 実行環境

### asdf を使う場合

Windows の場合、WSL2 もしくは Docker を使用してください

- 以下のコマンドを実行し、必要なパッケージをインストールする

  ```bash
  asdf plugin add python
  asdf plugin add nodejs
  asdf install
  npm install
  pip install --upgrade pip
  pip install -r requirements.txt
  asdf reshim python
  pre-commit install
  ```

### asdf を使わない場合

- 必要な言語

  - Python
  - Node.js

- 以下のコマンドを実行し、必要なパッケージをインストールする

  ```bash
  npm install
  pip install --upgrade pip
  pip install -r requirements.txt
  pre-commit install
  ```

## 静的解析

手動で静的解析を実行する場合は以下のコマンドを実行する

```bash
pre-commit run --all-files
```

## サーバー起動

以下のコマンドで Web サーバーを起動する

```bash
$ npm start

> ci-example@0.0.1 start
> webpack-cli serve --mode development

ℹ ｢wds｣: Project is running at http://localhost:3000/
ℹ ｢wds｣: webpack output is served from /
ℹ ｢wds｣: Content not from webpack is served from /mnt/c/Users/rwakabay/ci-example/dist
ℹ ｢wds｣: 404s will fallback to /index.html
ℹ ｢wdm｣: wait until bundle finished: /
ℹ ｢wdm｣: Compiled successfully.
```

起動後、自動的にブラウザで <http://localhost:3000/> が開かれる

## ビルド

以下のコマンドで本番用にビルドする

```bash
$ npm run build

> ci-example@0.0.1 build
> webpack --mode production

asset index.html 249 bytes [emitted]
asset css/style.css 99 bytes [emitted] (name: main)
asset main.js 99 bytes [emitted] [minimized] (name: main)
Entrypoint main 198 bytes = css/style.css 99 bytes main.js 99 bytes
orphan modules 164 bytes [orphan] 2 modules
cacheable modules 192 bytes (javascript) 98 bytes (css/mini-extract)
  ./src/index.js + 1 modules 192 bytes [built] [code generated]
  css ./node_modules/...
webpack 5.48.0 compiled successfully in 25257 ms
```

dist 配下にビルドされたコードが出力される
