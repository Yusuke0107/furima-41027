## Usersテーブル
| Column             | Type   | Options     |
|--------------------|--------|-------------|
| nickname           | string | null: false |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false |
| first_name         | string | null: false |
| last_name          | string | null: false |
| first_name_kana    | string | null: false |
| last_name_kana     | string | null: false |
| birth_date         | date   | null: false |
### Association
- has_many :items
- has_one :order


## Itemsテーブル
| Column             | Type       | Options     |
|--------------------|------------|-------------|
| user               | references | null: false, foreign_key: true |
| item_name          | string     | null: false |
| description        | text       | null: false |
| category_id        | integer    | null: false |
| condition_id       | integer    | null: false |
| shopping_cost_id   | integer    | null: false |
| shopping_days_id   | integer    | null: false |
| shopping_origin_id | integer    | null: false |
| price              | integer    | null: false |
### Association
- belongs_to :user
- has_one :order


## Ordersテーブル
| Column         | Type       | Options                        |
|----------------|------------|--------------------------------|
| user           | references | null: false, foreign_key: true |
| item           | references | null: false, foreign_key: true |
### Association
- belongs_to :item
- belongs_to :user
- has_one :shopping_address


## Shopping_addressesテーブル
| Column             | Type       | Options     |
|--------------------|------------|-------------|
| order              | references | null: false, foreign_key: true |
| postal_code        | string     | null: false |
| shopping_origin_id | integer    | null: false |
| city               | string     | null: false |
| street_address     | string     | null: false |
| building_name      | string     |             |
| phone_number       | string     | null: false |
### Association
- belongs_to :order