# テーブル設計

## users テーブル

| Column             | Type    | Options                   |
| ------------------ | ------- | ------------------------- |
| nickname           | string  | null: false               |
| email              | string  | null: false, unique: true |
| encrypted_password | string  | null: false               |
| first_name         | string  | null: false               |
| last_name          | string  | null: false               |
| first_name_kana    | string  | null: false               |
| last_name_kana     | string  | null: false               |
| birthday           | date    | null: false               |

### Association

- has_many :items
- has_many :orders

## items テーブル

| Column        | Type    | Options     |
| ------------- | ------- | ----------- |
| user_id       |         |             |
| name          | string  | null: false |
| text          | text    | null: false |
| category      | integer | null: false |
| condition     | integer | null: false |
| postage       | integer | null: false |
| prefecture_id | integer | null: false |
| delivery      | integer | null: false |

### Association

- belongs_to :user
- has_one :order

## orders テーブル

| Column       | Type        | Options                        |
| ------------ | ----------- | ------------------------------ |
| user_id      | references  | null: false, foreign_key: true |
| item_id      | references  | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- has_one :shipping

## shippings テーブル

| Column        | Type       | Options      |
| ------------- | ---------- | ------------ |
| order_id      |            |              |
| post_cord     | string     | null: false  |
| prefecture_id | integer    | null: false  |
| city          | string     | null: false  |
| address       | string     | null: false  |
| building_name | string     |              |
| tel_number    | string     | null: false  |

### Association

- belongs_to :order