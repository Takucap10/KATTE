# README

# アプリケーション名
KATTE

# アプリケーション概要
登録したユーザーがルームを作成し、メモを投稿することで、
投稿者を含む５名でメモを共有できるアプリケーション。
投稿したメモにチェックをつけることもできます。

# URL
https://katte-10.herokuapp.com/

# テスト用アカウント
ID    :test1@gmail.com
PASS  :111111(1を６回)

ID    :test2@gmail.com
PASS  :222222(2を６回)

# 利用方法
  1. トップページから利用者登録。
  2. ルームページからルームを作成（ルームネームと共有者最大４名を指定）。
  3. メモページからメモを投稿する。
  4. 買ったものにチェックなどを入れると誰が買ったかわかりやすい。

# 目指した課題解決
  買い物を頼まれた際、規格やサイズなどの間違いが起こらないように、
  買う物の共有をしつつ、細かい指定もつけやすくするアプリを作成しました。

# 洗い出した要件
* ユーザー投稿機能
  "・ユーザーを新しく登録できる。
  ・ユーザー登録ができていればログインができる。
  ・ニックネームを登録できる。
  ・ログアウトできる"
* ルーム投稿機能  
  "・メモを投稿できる部屋を作ることができる。
  ・作成者がメモルームの名前を作ることができる。
  ・メモを閲覧できるユーザーを選択できる。"
  "・ルームの中に作成される。
* メモ投稿機能
  ・品名、説明が投稿できる。
  ・閲覧はルーム全員にできるが、編集は投稿者のみ。"

# 実装した機能についての画像や説明
1. トップページ
  * https://gyazo.com/901c5f96cccf404db4d9fe93e32e7e67
2. ログイン画面
  * [![Image from Gyazo](https://i.gyazo.com/901c5f96cccf404db4d9fe93e32e7e67.png)](https://gyazo.com/901c5f96cccf404db4d9fe93e32e7e67)
3. ルーム投稿
  *  [![Image from Gyazo](https://i.gyazo.com/73ce92b431d44248827b4d8435d14486.gif)](https://gyazo.com/73ce92b431d44248827b4d8435d14486)
4. メモ投稿機能
  * [![Image from Gyazo](https://i.gyazo.com/5d12b18920a8d71d02c1b20660cb564b.gif)](https://gyazo.com/5d12b18920a8d71d02c1b20660cb564b)

# 実装予定の機能
1. メモ部分の編集削除機能
2. AMAZONや楽天からAPIを利用し、具体的な商品へのリンクを作成
3. メディアごとに合わせたCSSの適用


# DB 設計

## users_table

| Column              | Type   | Options                   |
| -------------------------------------------------------- |
| email               | string | null: false, unique: true |
| encrypted_ password | string | null: false               |
| nickname            | string | null: false               |

### Association
- has_many :room_users
-  has_many :rooms, through: :room_users
- has_many :memos

## rooms_table

| Column | Type   | Options     |
| ------ | ------ | ----------- |
| name   | string | null: false |

### Association
- has_many :room_users
- has_many :users, through: :room_users
- has_many :memos

## room_users table

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| user   | references | null: false, foreign_key: true |
| room   | references | null: false, foreign_key: true |

### Association

- belongs_to :room
- belongs_to :user

## memos_table

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| item    | string     | null:false                     |
| info    | text       |                                |
| user    | references | null: false, foreign_key: true |
| room    | references | null: false, foreign_key: true |

### Association

- belongs_to :room
- belongs_to :user

# ローカルでの動作方法
Ruby.on.railsの6.0.0で作成。
deviseを使用しているので、bundle installを使用してください。

migrateした際、リファレンスでエラーが出た場合は、
rails db:migrate:up VER=20220130134216(ユーザー)
rails db:migrate:up VER=20220206052651（ルーム）
を先にマイグレーションすると動きます。