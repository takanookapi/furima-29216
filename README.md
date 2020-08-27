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

- has_one :buy_item
- has_one :address
- has_many :sell_items



## sell_items テーブル

| Column            | Type    | Options     |
| ----------------- | ------- | ----------- |
| sell_user_id      | integer | null: false |
| buy_item_id       | integer | null: false |

### Association

- belongs_to :sell_user
- belongs_to :buy_item
- has_many :address_sell_items
- has_many :addresses, through: :address_sell_items



## buy_items テーブル

| Column        | Type       | Options                        |
| ------------  | ---------- | ------------------------------ |
| title         | string     | null: false                    |
| content       | string     | null: false                    |
| category      | string     | null: false                    |
| price         | string     | null: false                    |
| credit_card   | string     | null: false                    |
| sell_user_id   | integer    | null: false                   |

### Association

- belongs_to :sell_user
- belongs_to :sell_item
- has_many :address_buy_items
- has_many :addresses, through: :address_buy_items



## address テーブル

| Column        | Type       | Options                        |
| ------------  | ---------- | ------------------------------ |
| text          | string     | null: false                    |

### Association

- belongs_to :sell_users
- has_many :address_buy_items
- has_many :buy_items, through: :address_buy_items
- has_many :address_sell_items
- has_many :sell_items, through: :address_sell_items



## address_buy_items テーブル

| Column        | Type       | Options                        |
| ------------  | ---------- | ------------------------------ |
| address_id    | string     | null: false                    |
| buy_item_id   | string     | null: false                    |

### Association

- has_many :addresses
- has_many :buy_items



## address_sell_items テーブル

| Column        | Type       | Options                        |
| ------------  | ---------- | ------------------------------ |
| address_id    | string     | null: false                    |
| sell_item_id   | string     | null: false                    |

### Association

- has_many :addresses
- has_many :sell_items

