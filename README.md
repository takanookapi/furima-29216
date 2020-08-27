## sell_users テーブル

| Column          | Type   | Options     |
| --------------  | ------ | ----------- |
| name            | string | null: false |
| email           | string | null: false |
| password        | string | null: false |
| first_name      | string | null: false |
| last_name       | string | null: false |
| first_name_kana | string | null: false |
| last_name_kana  | string | null: false |
| birthday 1      | string | null: false |
| birthday 2      | string | null: false |
| birthday 3      | string | null: false |
| address         | string | null: false |

### Association

- has_many :photos


## sell_items テーブル

| Column            | Type   | Options     |
| ----------------- | ------ | ----------- |
| user_id           | string | null: false |
| item_id           | string | null: false |


### Association

- belongs_to :sell_users


## buy_users テーブル


| Column          | Type   | Options     |
| --------------  | ------ | ----------- |
| name            | string | null: false |
| email           | string | null: false |
| password        | string | null: false |
| first_name      | string | null: false |
| last_name       | string | null: false |
| first_name_kana | string | null: false |
| last_name_kana  | string | null: false |
| birthday 1      | string | null: false |
| birthday 2      | string | null: false |
| birthday 3      | string | null: false |
| credit_card     | string | null: false |

### Association

- has_one :items

## buy_items テーブル

| Column        | Type       | Options                        |
| ------------  | ---------- | ------------------------------ |
| title         | string     | null: false                    |
| content       | string     | null: false                    |
| category      | string     | null: false                    |
| price         | string     | null: false                    |
| buy_user_id   | string     | null: false                    |

### Association

- belongs_to :buy_users



