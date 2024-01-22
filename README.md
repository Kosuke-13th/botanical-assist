# アプリケーション名
Botanical-Assist  

# アプリケーション概要
植物を育てるうえで「重要な作業」を「適切なタイミング」で行うことをサポートすることができる。

# URL
https://botanical-assist.onrender.com

# テスト用アカウント
・Basic認証パスワード：1318  
・Basic認証ID：test  
・メールアドレス：test@gmail.com  
・パスワード：1111kk  

# 利用方法
## 植物管理
1.ログインページからユーザー新規登録を行う。  
2.新規植物登録ボタンから、  
植物の情報（名前・種類・水やりの頻度・成長の時期・薬散の時期・画像・備考・値段・管理開始日）を入力し登録する。  
3.トップページの当日行う作業が完了したら「作業完了」ボタンを押す。


# アプリケーションを作成した背景
植物販売の事業をしている父にヒアリングをしたところ、新規顧客を獲得する課題があった。  
実際に店頭で接客をした結果、「枯らしてしまう」や「育てるのが難しい」といった意見があった。  
植物を育てるサポートすることで、新規顧客が安心して購入できると仮説を立てた。  
「植物育成で必要な作業を適切なタイミングで行えていないこと」を解決するために、  
植物の情報を入力することで今日必要な作業が表示される植物管理アプリケーションを開発することにした。

# 洗い出した要件
[要件を定義したシート](https://docs.google.com/spreadsheets/d/1nSNIRaexLVh-KC6fqra9_BGEyC5fOeXAqJ4UAQlw2lY/edit#gid=982722306)
  
# 実装した機能についての画像やGIFおよびその説明
  
  
# 実装予定の機能
## 販売店へ問い合わせ
植物も生き物のため、環境や個体により育成方法が変わることがある。  
販売者が責任をもってサポートすることでより購入者を安心させることができる。  
1.植物詳細ページより「販売店へ問い合わせ」ボタンを押す。  
2.チャット画面で、購入した植物について問い合わせができる。

# データベース設計

  

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
