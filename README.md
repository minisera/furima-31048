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
| birthday            | integer| null: false |

### Association

- has_many :prototypes
- has_many :comments
- belongs_to :address
- belongs_to :credit

## addressesテーブル

| Column     | Type         | Options                        |
| ---------- | ------------ | ------------------------------ |
| user       | references   | null: false, foreign_key: true |
| postal     | integer      | null: false                    | 
| prefecture | string       | null: false                    |
| city       | string       | null: false                    |
| address    | string       | null: false                    |
| building   | string       |                                |
| phone      | integer      | null: false                    |

### Association

- belongs_to :user

## creditsテーブル

| Column     | Type         | Options                        |
| ---------- | ------------ | ------------------------------ |
| user       | references   | null: false, foreign_key: true |
| number     | integer      | null: false                    | 
| limit      | integer      | null: false                    |
| security   | integer      | null: false                    |

### Association

- belongs_to :user

## itemsテーブル

| Column     | Type         | Options                        |
| ---------- | ------------ | ------------------------------ |
| user       | references   | null: false, foreign_key: true |
| name       | string       | null: false                    | 
| image      | string       | null: false                    |
| price      | integer      | null: false                    |
| status     | string       | null: false                    |
| category   | string       | null: false                    |
| comment    | text         | null: false                    |
| stock      | integer      | null: false                    |

### Association

- has_many :comments
- belongs_to :user
- belongs_to :delivery

## commentsテーブル

| Column     | Type         | Options                        |
| ---------- | ------------ | ------------------------------ |
| user       | references   | null: false, foreign_key: true |
| item       | references   | null: false, foreign_key: true |
| text       | text         | null: false                    |

### Association

- belongs_to :user
- belongs_to :item

## deliveriesテーブル

| Column     | Type         | Options                        |
| ---------- | ------------ | ------------------------------ |
| item       | references   | null: false, foreign_key: true |
| charge     | string       | null: false                    |
| source     | string       | null: false                    |
| day        | string       | null: false                    |

### Association

- belongs_to :item