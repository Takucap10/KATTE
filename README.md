# README

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

## comments_table

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| content | string     | null: false                    |
| memo    | references | null: false                    |
| user    | references | null: false, foreign_key: true |
| room    | references | null: false, foreign_key: true |