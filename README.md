# テーブル設計

## users テーブル
| Column     | Type   | Options     |
| ---------- | ------ | ----------- |
| nickname   | string | null: false |
| email      | string | null: false |
| password   | string | null: false |
| family_name|        | string | null: false |
| first_name | text   | null: false |
| family_name_kana | text   | null: false |
| first_name_kana | text   | null: false |
| birth_day| date | null: false |

### Association
- has_many :items
- has_many :buyers

## items テーブル
| Column    | Type       | Options           |
| --------- | ---------- | ----------------- |
| name     | string     | null: false |
| description | string       | null: false |
| category | string       | null: false |
| status      | string | null: false |
| cost | string | null: false |
| area | string | null: false |
| days | string | null: false |
| price | integer | null: false |
| user_id | references  | null: false, foreign_key: true |

### Association
- belongs_to :user
- belongs_to :buyer

## buyers テーブル
| Column    | Type       | Options                        |
| --------- | ---------- | ------------------------------ |
| user_id   | references | null: false, foreign_key: true |
| item_id   | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- belongs_to :item