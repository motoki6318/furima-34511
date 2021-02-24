# テーブル設計

## users テーブル

| Column        | Type    | Options     |
| ------------- | ------- | ----------- |
| nickname      | string  | null: false |
| email         | string  | null: false |
| password      | string  | null: false |
| name          | string  | null: false |
| name_ reading | string  | null: false |
| birthday      | integer | null: false |

### Association

- has_many :items
- has_many :orders

## items テーブル

| Column       | Type    | Options     |
| ------------ | ------- | ----------- |
| user_id      |         |             |
| image        |         | null: false |
| name         | string  | null: false |
| text         | text    | null: false |
| category     | integer | null: false |

### Association

- belongs_to :user
- has_one :order

## orders テーブル

| Column       | Type    | Options     |
| ------------ | ------- | ----------- |
| user_id      |         |             |
| item_id      |         |             |

### Association

- belongs_to :user
- belongs_to :item
- has_one :shippings

## shippings テーブル

| Column        | Type       | Options      |
| ------------- | ---------- | ------------ |
| order_id      |            |              |
| post_cord     | string     | null: false  |
| prefecture_id | integer    | null: false  |
| building_name | string     |              |
| tel_number    | integer    | null: false  |

### Association

- belongs_to :order