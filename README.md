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


## Itemsテーブル
| Column          | Type       | Options     |
|-----------------|------------|-------------|
| user            | references | null: false, foreign_key: true |
| item_name       | string     | null: false |
| description     | text       | null: false |
| price           | integer    | null: false |
### Association
- belongs_to :user
- has_one :order


## Ordersテーブル
| Column         | Type       | Options                        |
|----------------|------------|--------------------------------|
| user           | references | null: false, foreign_key: true |
| item           | references | null: false, foreign_key: true |
### Association
- belongs_to :shipping_address
- belongs_to :item
- has_one :shipping_address


## shipping_addressesテーブル
| Column         | Type       | Options     |
|----------------|------------|-------------|
| postal_code    | string     | null: false |
| state          | string     | null: false |
| city           | string     | null: false |
| street_address | string     | null: false |
| building_name  | string     |             |
| phone_number   | string     | null: false |
### Association
- belongs_to :order