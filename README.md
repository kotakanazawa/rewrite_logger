## サービス概要

「リライトログ」は、「特定のキーワードの検索順位の変動を監視するのが面倒」という問題を解決したい、ブログ運営者向けの「検索順位チェックツール」です。

ユーザーは、「特定のキーワードの検索順位と記事URLを記録し、変更点についてのコメントを残すことができます。

## Setup

```
$ .bin/setup
$ rails server
```

ローカルでテストデータをみたいときのアカウント情報。

- email: testtest@example.com
- pass: testtest

## ローカルで動かす場合

ローカルの動作環境には PostgreSQL が必要です。

また、Google の Custom Search JSON API を使用して検索順位を取得しています。ローカルで検索順位を取得するには、Google のAPIキーが必要になります。

[Custom Search JSON API  \|  Programmable Search Engine](https://developers.google.com/custom-search/v1/overview)

## テスト

テスト
```
$ ./bin/test
```

## Lint

```
$ ./bin/lint
```
