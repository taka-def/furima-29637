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
| birthday_date       | date   | null: false              |

### Association

- has_many :products
- has_many :purchase record


## products テーブル

| Columu          | Type       | Options                       |
| --------------- | ------     | ----------------------------- |
| user            | references | null: false,foreign_key: true |
| products_name   | string     | null: false                   |
| text            | text       | null: false                   |
| category_id     | integer    | null: false                   |
| state_id        | integer    | null: false                   |
| delivery_fee_id | integer    | null: false                   |
| area_id         | integer    | null: false                   |
| days_id         | integer    | null: false                   |
| price           | integer    | null: false                   |

### Association

- belong_to :user
- has_one :purchase_record

## purchase_record テーブル

| Columu         | Type       | Options                       |
| -------------- | ---------- | ----------------------------- |
| user           | references | null: false,foreign_key: true |
| product        | references | null: false,foreign_key: true |

### Association

- belong_to :user
- belong_to :products
- has_one :address


## address テーブル

| Columu          | Type       | Options                       |
| --------------- | ---------- | ----------------------------- |
| zip_code        | string     | null: false                   |
| area_id         | integer    | null: false                   |
| city            | string     | null: false                   |
| street_number   | string     | null: false                   |
| building_name   | string     |                               |
| phone_number    | string     | null: false                   |
| purchase_record | references | null: false,foreign_key: true |

### Association

- belong_to :purchase_record