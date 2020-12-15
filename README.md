# テーブル設計

## users テーブル

| Columu              | Type   | Options                  |
| ------------------- | ------ | ------------------------ |
| first_name          | string | null: false              |
| last_name           | string | null: false              |
| first_ name_frigana | string | null: false              |
| last_name_frigana   | string | null: false              |
| email               | string | null: false,unique: true |
| encrypted_password  | string | null: false              |
| nickname            | string | null: false,unique: true |
| birthday_date       | string | null: false              |

### Association

- has_many :products
- has_many :purchase record


## products テーブル

| Columu          | Type       | Options                       |
| --------------- | ------     | ----------------------------- |
| user            | references | null: false,foreign_key: true |
| products name   | string     | null: false                   |
| text            | text       | null: false                   |
| category_id     | integer    | null: false                   |
| state_id        | integer    | null: false                   |
| delivery fee_id | integer    | null: false                   |
| area_id         | integer    | null: false                   |
| days_id         | integer    | null: false                   |
| price           | integer    | null: false                   |

### Association

- belong_to :user

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
| area_id        | integer    | null: false                   |
| city           | string     | null: false                   |
| street number  | string     | null: false                   |
| building name  | string     |                               |
| phone number   | string     | null: false                   |
| products       | references | null: false,foreign_key: true |

### Association

- belong_to :purchase record