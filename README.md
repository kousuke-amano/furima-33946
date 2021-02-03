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


## users テーブル

|  Column         | Type   | Options                  |
|  --------       | ------ | ------------------------ |
| nickname        | string | null: false              |
| email           | string | null: false, unique: true|
| password        | string | null: false              |
| last_name       | string | null: false              |
| first_name      | string | null: false              |
| last_name_kana  | string | null: false              |
| first_name_kana | string | null: false              |
| dateofbirth     | date   | null: false              |


### Association

- has_many   :items
- has_many   :buyers


## items テーブル

|  Column     | Type   | Options                       |
|  --------   | ------ | ----------------------------  |
| item        | string |       null: false             |
| description | text   |       null: false             |
| category    | string |       null: false             |
| state       | string |       null: false             |
| burden      | string |       null: false             |
| area        | string |       null: false             |
| date        | string |       null: false             |
| price       | string |       null: false             |
| fee         | string |       null: false             |
| profit      | string |       null: false             |


### Association

- belongs_to :user
- has_one    :buyer


image    ActiveStorageで実装


## buyers テーブル

|  Column      | Type       | Options                        |
|  --------    | ---------- | -----------------------------  |
| user_id      | references | null: false, foreign_key: true |
| item_id      | references | null: false, foreign_key: true |
| buyer_id     | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- belongs_to :address


## addresses テーブル

|  Column         | Type   | Options                        |
|  --------       | ------ | ------------------------------ |
| postal code     | string | null: false                    |
| prefectures_id  | integer| null: false, foreign_key: true |
| municipality    | string | null: false                    |
| adress          | string | null: false                    |
| building        | string |                                |
| phone number    | string | null: false                    |

### Association

- belongs_to :buyer