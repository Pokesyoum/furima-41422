# テーブル設計

## usersテーブル

| Column             | Type   | Options                   |
| ------------------ | ------ | ------------------------- |
| nickname           | string | null: false               |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false               |
| last_name          | string | null: false               |
| first_name         | string | null: false               |
| last_kana          | string | null: false               |
| first_kana         | string | null: false               |
| birth_day          | date   | null: false               |

## Association

-has_many :items
-has_many :orders

## itemsテーブル

| Column      | Type       | Options                        |
| ----------- | ---------- | ------------------------------ |
| item_name   | string     | null: false                    |
| description | text       | null: false                    |
| category_id | integer    | null: false                    |
| status_id   | integer    | null: false                    |
| fee_id      | integer    | null: false                    |
| area_id     | integer    | null: false                    |
| day_id      | integer    | null: false                    |
| price       | integer    | null: false                    |
| user        | references | null: false, foreign_key: true |

## Association

-belongs_to :category
-belongs_to :status
-belongs_to :fee
-belongs_to :area
-belongs_to :day
-belongs_to :user
-has_one    :order

## ordersテーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| user   | references | null: false, foreign_key: true |
| item   | references | null: false, foreign_key: true |

## Association

-belongs_to :user
-belongs_to :item
-has_one    :address

## addressesテーブル

| Column       | Type       | Options                        |
| ------------ | ---------- | ------------------------------ |
| postal_code  | string     | null: false                    |
| area_id      | integer    | null: false                    |
| city         | string     | null: false                    |
| street       | string     | null: false                    |
| building     | string     |                                |
| phone_number | string     | null: false                    |
| order        | references | null: false, foreign_key: true |

## Association

-belongs_to :area
-belongs_to :order