# CI 例

## 目次

- [実行環境](#実行環境)
- [静的解析](#静的解析)

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

### pre-commit

手動で静的解析を実行する場合は以下のコマンドを実行する

```bash
pre-commit run --all-files
```

### Super-Linter

※ Docker が必要

```bash
npm run super_lint
```

super-linter/super-linter.log に実行結果が保存される

### CodeQL

※ Docker が必要

```bash
npm run codeql
```

codeql/results/codeql.csv に実行結果が保存される
