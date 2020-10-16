＃テーブル設計

## users テーブル

| Column              | Type   | Options     |
| ------------------- | ------ | ----------- |
| nickname            | string | null: false |
| email               | string | null: false |
| password            | string | null: false |
| first_name          | string | null: false |
| last_name           | string | null: false |
| first_name_katakana | string | null: false |
| last_name_katakana  | string | null: false |
| birthday            | date   | null: false |

### Association

- has_many :items
- has_many :comments
- has_many :orders

## itemsテーブル

| Column        | Type         | Options                        |
| --------------| ------------ | ------------------------------ |
| user          | references   | null: false, foreign_key: true |
| name          | string       | null: false                    | 
| comment       | text         | null: false                    |
| price         | integer      | null: false                    |
| status_id     | integer      | null: false                    |
| category_id   | integer      | null: false                    |
| charge_id     | integer      | null: false                    |
| source_id     | integer      | null: false                    |
| day_id        | integer      | null: false                    |

### Association

- has_many :comments
- belongs_to :user
- has_one :order

## ordersテーブル

| Column     | Type         | Options                        |
| ---------- | ------------ | ------------------------------ |
| item       | references   | null: false, foreign_key: true |
| user       | references   | null: false, foreign_key: true |

### Association

- belongs_to :item
- belongs_to :user
- has_one :address

## addressesテーブル

| Column        | Type         | Options                        |
| ------------- | ------------ | ------------------------------ |
| order         | references   | null: false, foreign_key: true |
| postal        | string       | null: false                    | 
| prefecture_id | integer      | null: false                    |
| city          | string       | null: false                    |
| address       | string       | null: false                    |
| building      | string       |                                |
| phone         | string       | null: false                    |

### Association

- belongs_to :order

## commentsテーブル

| Column     | Type         | Options                        |
| ---------- | ------------ | ------------------------------ |
| user       | references   | null: false, foreign_key: true |
| item       | references   | null: false, foreign_key: true |
| text       | text         | null: false                    |

### Association

- belongs_to :user
- belongs_to :item
