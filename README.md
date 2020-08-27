## users テーブル

| Column          | Type    | Options                        |
| --------------  | ------- | ------------------------------ |
| name            | string  | null: false                    |
| email           | string  | null: false                    |
| password        | string  | null: false                    |
| first_name      | string  | null: false                    |
| last_name       | string  | null: false                    |
| first_name_kana | string  | null: false                    |
| last_name_kana  | string  | null: false                    |
| date            | string  | null: false                    |

### Association


- has_many :buy_items
- has_many :sell_items



## sell_items テーブル

| Column            | Type    | Options                       |
| ----------------- | ------- | ----------------------------- |
| user_id           | integer | null: false, foreign_key: true| 
| buy_item_id       | integer | null: false, foreign_key: true|
| address_id        | integer | null: false, foreign_key: true|

### Association

- has_one    :address
- belongs_to :user



## buy_items テーブル

| Column        | Type       | Options                        |
| ------------  | ---------- | ------------------------------ |
| title         | string     | null: false                    |
| content       | string     | null: false                    |
| category      | string     | null: false                    |
| item_status   | string     | null: false                    |
| shipping_fee  | string     | null: false                    |
| shipping_orig | string     | null: false                    |
| shipping_days | string     | null: false                    |
| price         | string     | null: false                    |
| user_id       | integer    | null: false, foreign_key: true |
| address_id    | string     | null: false, foreign_key: true |

### Association

- has_one    :address
- belongs_to :user



## address テーブル

| Column        | Type       | Options                        |
| ------------  | ---------- | ------------------------------ |
| postal_code   | string     | null: false                    |
| prefecture    | string     | null: false                    |
| city          | string     | null: false                    |
| address_other | string     | null: false                    |
| building_name | string     | null: true                     |
| telephone_num | string     | null: false                    |

### Association

- belongs_to :buy_item
- belongs_to :sell_item