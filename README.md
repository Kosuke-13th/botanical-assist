# テーブル設計

## users テーブル

| Column             | Type    | Options                  |
| ------------------ | ------- | ------------------------ |
| name               | string  | null: false              |
| region_id          | integer | null: false              |
| email              | string  | null: false, unique: true|
| encrypted_password | string  | null: false              |

### Association

has_many :items

## plants テーブル

| Column                | Type       | Options                        |
| --------------------- | ---------- | ------------------------------ |
| plant_name            | string     | null: false                    |
| plant_category        | string     | null: false                    |
| watering_id           | integer    | null: false                    |
| watering_day          | datetime   | null: false                    |
| growth_time_id        | integer    | null: false                    |
| growth_day            | datetime   | null: false                    |
| agrochemical_time_id  | integer    | null: false                    |
| agrochemical_day      | datetime   | null: false                    |
| plant_text            | text       |                                |
| plant_price           | integer    |                                |
| user                  | references | null: false, foreign_key: true |

### Association

belongs_to :user
