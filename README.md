
# テーブル設計

## users テーブル

| Column   | Type   | Options     |
| -------- | ------ | ----------- |
| name     | string | null: false |
| email    | string | null: false |
| password | string | null: false |
| profile  | text   | null: false |
| position | text   | null: false |
|occupation| text   | null: false |

### Association

- has_many :prototypes
- has_many :, through: 
- has_many :comments

## prototypes テーブル

| Column   | Type   | Options     |
| -------- | ------ | ----------- |
| title    | string | null: false |
|catch_copy| text   | null: false |
| concept  | text   | null: false |
| imege    | text   | null: false |
| user   |references| null: false |

### Association

- has_many   :comments
- belongs_to :users

## comments テーブル

| Column   | Type   | Options     |
| -------- | ------ | ----------- |
| text     | text   | null: false |
| user   |references| null: false |
| prototype | references | null: false |

### Association

- belongs_to :users
- belongs_to :prototypes
