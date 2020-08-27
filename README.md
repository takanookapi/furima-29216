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
| date            | string | null: false |
| address         | string | null: false |

### Association

- has_many :sell_items
- has_one :buy_item



## sell_items テーブル

| Column            | Type    | Options     |
| ----------------- | ------- | ----------- |
| sell_user_id      | integer | null: false |
| buy_item_id       | integer | null: false |


### Association

- belongs_to :sell_user



## buy_items テーブル

| Column        | Type       | Options                        |
| ------------  | ---------- | ------------------------------ |
| title         | string     | null: false                    |
| content       | string     | null: false                    |
| category      | string     | null: false                    |
| price         | string     | null: false                    |
| address       | string     | null: false                    |
| credit_card   | string     | null: false                    |
| buy_user_id   | string     | null: false                    |

### Association

- belongs_to :sell_user
