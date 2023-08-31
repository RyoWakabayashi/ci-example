# CI 例

## 目次

- [実行環境](#実行環境)
- [静的解析](#静的解析)

## 実行環境

### asdf を使う場合

Windows の場合、WSL2 もしくは Docker を使用してください

- asdf のプラグインを追加する

  ```bash
  awk '{system("asdf plugin-add " $1)}' .tool-versions
  ```

- 必要な開発言語をインストールする

  ```bash
  asdf install
  ```

- Node.js の依存パッケージをインストールする

  ```bash
  npm install
  ```

- Python の依存パッケージをインストールする

  ```bash
  pip install --upgrade pip \
    && pip install -r requirements.txt
    && asdf reshim python
  ```

### asdf を使わない場合

- 必要な言語

  - Python
  - Node.js

- Node.js の依存パッケージをインストールする

  ```bash
  npm install
  ```

- Python の依存パッケージをインストールする

  ```bash
  pip install --upgrade pip \
    && pip install -r requirements.txt
  ```

## 静的解析

### pre-commit

手動で静的解析を実行する場合は以下のコマンドを実行する

```bash
pre-commit run --all-files
```

コミット時に静的解析を自動実行する場合は以下のコマンドを実行する

```bash
pre-commit install
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
