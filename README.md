## Usersテーブル
| Column          | Type   | Options     |
|-----------------|--------|-------------|
| nickname        | string | null: false |
| email           | string | null: false, unique: true |
| password        | string | null: false |
| first_name      | string | null: false |
| last_name       | string | null: false |
| first_name_kana | string | null: false |
| last_name_kana  | string | null: false |
| birth_date      | string | null: false |
### Association
- has_many :items


## Itemsテーブル
| Column          | Type       | Options     |
|-----------------|------------|-------------|
| user_id         | references | foreign_key: true |
| image           | string     | null: false |
| item_name       | string     | null: false |
| description     | string     | null: false |
| category        | string     | null: false |
| condition       | string     | null: false |
| shopping_cost   | string     | null: false |
| shopping_origin | string     | null: false |
| shopping_days   | string     | null: false |
| price           | string     | null: false |
| fee             | string     |             |
| profit          | string     |             |
### Association
- belongs_to :user
- has_one :order
- has_many :comments


## Ordersテーブル
| Column         | Type       | Options     |
|----------------|------------|-------------|
| user_id        | references | foreign_key: true |
| item_id        | references | foreign_key: true |
| postal_code    | string     | null: false |
| state          | string     | null: false |
| city           | string     | null: false |
| street_address | string     | null: false |
| building_name  | string     |             |
| phone_number   | string     | null: false |
### Association
- belongs_to :item
- belongs_to :user


## Commentsテーブル
| Column  | Type       | Options           |
|---------|------------|-------------------|
| item_id | references | foreign_key: true |
| user_id | references | foreign_key: true |
| text    | string     |                   |
### Association
- belongs_to :item