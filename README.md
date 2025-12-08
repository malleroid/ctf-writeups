# CTF Writeups

CTFの問題解答記録を[mdBook](https://rust-lang.github.io/mdBook/)で管理しているリポジトリです。

## 📖 ドキュメント

GitHub Pagesで公開しています:

👉 **https://malleus.me/ctf-writeups/**

## 📝 収録コンテンツ

- **CPAW (CyberDefenders Practical Application Workshop)**
  - Level 1の問題と解答

## 🛠️ ローカルでのビルド

### 必要なもの

- [Docker](https://www.docker.com/)

### ビルド手順

```bash
# リポジトリをクローン
git clone https://github.com/malleroid/ctf-writeups.git
cd ctf-writeups

# Dockerでビルド
docker build --target ci-builder -t mdbook-builder .
docker run --rm -v $(pwd):/data mdbook-builder sh -c "mdbook-mermaid install . && mdbook build"

# book/index.html が生成されます
open book/index.html
```

### 開発サーバーの起動

```bash
# 開発用サーバーを起動（ホットリロード対応）
docker build --target development -t mdbook-dev .
docker run --rm -p 3000:3000 -v $(pwd):/book mdbook-dev

# ブラウザで http://localhost:3000 にアクセス
```

## 🏗️ プロジェクト構成

```
.
├── src/              # mdBookのソースファイル
│   ├── SUMMARY.md    # 目次
│   └── cpaw/         # CPAWの問題
├── book.toml         # mdBookの設定
├── Dockerfile        # ビルド環境
└── .github/          # CI/CD設定
    ├── workflows/    # GitHub Actions
    └── actions/      # 再利用可能なアクション
```

## 🚀 デプロイ

`main`ブランチへのpush時に、GitHub Actionsが自動的にGitHub Pagesへデプロイします。

## 📄 ライセンス

このリポジトリの内容は個人の学習記録です。
