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

|  Column      | Type   | Options     |
|  --------    | ------ | ----------- |
| nickname     | string | null: false |
| name         | string | null: false |
| email        | string | null: false |
| password     | string | null: false |
| dateofbirth  | text   | null: false |


### Association

- has_many   :items
- belongs_to :buyer
- belongs_to :addresse


## items テーブル

|  Column     | Type   | Options                       |
|  --------   | ------ | ----------------------------  |
| item        | string |       null: false             |
| description | text   |       null: false             |
| delivery    | text   |       null: false             |
| price       | string |       null: false             |


### Association

- belongs_to :user
- belongs_to :buyer
- belongs_to :addresse

image    ActiveStorageで実装


## buyers テーブル

|  Column      | Type   | Options                        |
|  --------    | ------ | -----------------------------  |
| user_id      | string | null: false, foreign_key: true |
| item_id      | string | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item


## addresses テーブル

|  Column         | Type   | Options                        |
|  --------       | ------ | ------------------------------ |
| postal code     | string | null: false                    |
| prefectures_id  | string | null: false, foreign_key: true |
| municipality    | string | null: false                    |
| adress          | string | null: false                    |
| building        | string | null: false                    |
| phone number    | string | null: false                    |

### Association

- belongs_to :user