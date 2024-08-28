# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...


# テーブル設計

## usersテーブル

| Column             | Type   | Options                   |
| ------------------ | ------ | ------------------------- |
| name               | string | null: false               |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false               |

## Association

-has_many :items
-has_many :orders
-has_many :addresses

## itemsテーブル

| Column    | Type      | Options                        |
| --------- | --------- | ------------------------------ |
| item_name | string    | null: false                    |
| price     | integer   | null: false                    |
| user_id   | reference | null: false, foreign_key: true |

## Association

-belongs_to :user
-has_one    :order

## ordersテーブル

| Column  | Type      | Options                        |
| ------- | --------- | ------------------------------ |
| token   | string    | null: false, unique: true      |
| user_id | reference | null: false, foreign_key: true |
| item_id | reference | null: false, foreign_key: true |

## Association

-belongs_to :user
-belongs_to :item
-belongs_to :address

## addressesテーブル

| Column      | Type      | Options                        |
| ----------- | --------- | ------------------------------ |
| postal_code | string    | null: false                    |
| prefecture  | string    | null: false                    |
| city        | string    | null: false                    |
| street      | string    | null: false                    |
| building    | string    |                                |
| user_id     | reference | null: false, foreign_key: true |
| order_id    | reference | null: false, foreign_key: true |

## Association

-belongs_to :user
-has_one    :order