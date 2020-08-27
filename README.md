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
| address_id      | integer | null: false, foreign_key: true |

### Association

- has_one  :address
- has_many :buy_items
- has_many :sell_items



## sell_items テーブル

| Column            | Type    | Options                       |
| ----------------- | ------- | ----------------------------- |
| user_id           | integer | null: false, foreign_key: true| 
| buy_item_id       | integer | null: false, foreign_key: true|

### Association

- belongs_to :user
- belongs_to :buy_item



## buy_items テーブル

| Column        | Type       | Options                        |
| ------------  | ---------- | ------------------------------ |
| title         | string     | null: false                    |
| content       | string     | null: false                    |
| category      | string     | null: false                    |
| price         | string     | null: false                    |
| credit_card   | string     | null: false                    |
| user_id       | integer    | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :sell_item



## address テーブル

| Column        | Type       | Options                        |
| ------------  | ---------- | ------------------------------ |
| postal_code   | string     | null: false                    |
| prefecture    | string     | null: false                    |
| city          | string     | null: false                    |
| address_other | string     | null: false                    |
| building_name | string     | null: false                    |
| telephone_num | string     | null: false                    |

### Association

- belongs_to :user
