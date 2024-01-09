# テーブル設計

概要
複数の植物を管理している人が今必要なことが何かを定期的に教えてくれる
初めて植物を購入する人が店員や詳しい人に何を聞けばよいかわかる
今後は販売者アカウントを作れるようにして販売者と購入者が交流しやすいようにする。

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
