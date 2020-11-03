# テーブル設計

## users テーブル
| Column     | Type   | Options     |
| ---------- | ------ | ----------- |
| nickname   | string | null: false |
| email      | string | null: false |
| password   | string | null: false |
| family_name| string | null: false |
| first_name | string | null: false |
| family_name_kana | string | null: false |
| first_name_kana | string | null: false |
| birth_day| date | null: false |

### Association
- has_many :items
- has_many :buyers

## items テーブル
| Column    | Type       | Options           |
| --------- | ---------- | ----------------- |
| name     | string     | null: false |
| description | text | null: false |
| category | string       | null: false |
| status | integer | null: false |
| cost | integer | null: false |
| area | integer | null: false |
| days | integer | null: false |
| price | integer | null: false |
| user | references  | null: false, foreign_key: true |

### Association
- belongs_to :user
- belongs_to :buyer

## buyers テーブル
| Column    | Type       | Options                        |
| --------- | ---------- | ------------------------------ |
| user   | references | null: false, foreign_key: true |
| item   | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- belongs_to :item
- has_one :address

## addresses テーブル
| Column     | Type   | Options     |
| ---------- | ------ | ----------- |
| post_code | string | null: false |
| prefectures | string | null: false |
| city   | string | null: false |
| block  | string | null: false |
| building_name| string |
| phone_number | string | null: false |
| buyer | references | null: false, foreign_key: true |

### Association
- belongs_to :buyer