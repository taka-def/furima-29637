# テーブル設計

## users テーブル

| Columu             | Type   | Options                  |
| ------------------ | ------ | ------------------------ |
| first name         | string | null: false              |
| last name          | string | null: false              |
| first name frigana | string | null: false              |
| last name frigana  | string | null: false              |
| email              | string | null: false,unique: true |
| encrypted_password | string | null: false              |
| nickname           | string | null: false,unique: true |
| birthday DATE      | string | null: false              |

### Association

- has_many :products
- has_many :purchase record


## products テーブル

| Columu          | Type       | Options                       |
| --------------- | ------     | ----------------------------- |
| user            | references | null: false,foreign_key: true |
| products name   | string     | null: false                   |
| text            | string     | null: false                   |
| category_id     | string     | null: false                   |
| state_id        | string     | null: false                   |
| delivery fee_id | string     | null: false                   |
| area_id         | string     | null: false                   |
| days_id         | string     | null: false                   |
| price_id        | string     | null: false                   |

### Association

- belong_to :users

## purchase record テーブル

| Columu         | Type       | Options                       |
| -------------- | ---------- | ----------------------------- |
| user           | references | null: false,foreign_key: true |
| products       | references | null: false,foreign_key: true |

### Association

- belong_to :users
- has_one :address


## address テーブル

| Columu         | Type       | Options                       |
| -------------- | ---------- | ----------------------------- |
| zip code       | string     | null: false                   |
| area_id        | string     | null: false                   |
| city           | string     | null: false                   |
| street number  | string     | null: false                   |
| building name  | string     |                               |
| phone number   | string     | null: false                   |
| products       | references | null: false,foreign_key: true |

### Association

- belong_to :purchase record