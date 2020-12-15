# テーブル設計

## users テーブル

| Columu   | Type   | Options                  |
| -------- | ------ | ------------------------ |
| username | string | null: false              |
| email    | string | null: false,unique: true |
| password | string | null: false              |
| nickname | string | null: false,unique: true |
| birthday | string | null: false              |

### Association

- has_many :products
- has_many :purchase record


## products テーブル

| Columu        | Type       | Options                       |
| ------------- | ------     | ----------------------------- |
| username      | references | null: false,foreign_key: true |
| images        | string     | null: false                   |
| products name | string     | null: false                   |
| text          | string     | null: false                   |
| category      | string     | null: false                   |
| state         | string     | null: false                   |
| delivery fee  | string     | null: false                   |
| area          | string     | null: false                   |
| days          | string     | null: false                   |
| price         | string     | null: false                   |

### Association

- belong_to :users

## purchase record テーブル

| Columu         | Type       | Options                       |
| -------------- | ---------- | ----------------------------- |
| security code  | string     | null: false                   |
| credit number  | string     | null: false,unique: true      |
| expration date | string     | null: false                   |
| username       | references | null: false,foreign_key: true |

### Association

- belong_to :users
- has_many :address


## address テーブル

| Columu         | Type       | Options                       |
| -------------- | ---------- | ----------------------------- |
| zip code       | string     | null: false                   |
| prefecture     | string     | null: false                   |
| city           | string     | null: false                   |
| street number  | string     | null: false                   |
| building name  | string     | null: false                   |
| phone number   | string     | null: false                   |
| username       | references | null: false,foreign_key: true |

### Association

- belong_to :purchase record