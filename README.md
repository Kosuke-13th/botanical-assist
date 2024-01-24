# アプリケーション名
Botanical-Assist  

# アプリケーション概要
植物を育てるうえで「必要なタスク」を「適切なタイミング」で行うことをサポートすることができる。

# URL
https://botanical-assist.onrender.com

# テスト用アカウント
* Basic認証パスワード：1318  
* Basic認証ID：test  
* メールアドレス：test@gmail.com  
* パスワード：1111kk  

# 利用方法
## 植物管理
1. トップページのヘッダーからユーザー新規登録を行う。  
1. 新規植物登録ボタンから、  
植物の情報（名前・種類・水やりの頻度・成長の時期・薬散の時期・画像・備考・値段・管理開始日）を入力し登録する。  
1. トップページの当日行う作業が完了したら「作業完了」ボタンを押す。


# アプリケーションを作成した背景
植物販売の事業をしている父にヒアリングをしたところ、新規顧客を獲得する課題があった。  
実際に店頭で接客をした結果、「枯らしてしまう」や「育てるのが難しい」といった意見があった。  
植物を育てるサポートすることで、新規顧客が安心して購入できると仮説を立てた。  
「植物育成で必要なタスクを適切なタイミングで行えていないこと」を解決するために、  
植物の情報を入力することで今日必要なタスクが表示される植物管理アプリケーションを開発することにした。

# 洗い出した要件
[要件を定義したシート](https://docs.google.com/spreadsheets/d/1nSNIRaexLVh-KC6fqra9_BGEyC5fOeXAqJ4UAQlw2lY/edit#gid=982722306)
  
# 実装した機能についての画像やGIFおよびその説明
ログイン後に当日行うタスクが表示される。「作業完了」ボタンを押したら次の予定として表示される。

[![Image from Gyazo](https://i.gyazo.com/ade36d8671935d80e9cc48240bd00186.gif)](https://gyazo.com/ade36d8671935d80e9cc48240bd00186)
  
# 実装予定の機能
## 販売店へ問い合わせ
植物も生き物のため、環境や個体により育成方法が変わることがある。  
販売者が責任をもってサポートすることでより購入者を安心させることができる。  
1. 植物詳細ページより「販売店へ問い合わせ」ボタンを押す。  
1. チャット画面で、購入した植物について問い合わせができる。

# データベース設計

  [![Image from Gyazo](https://i.gyazo.com/5ae0a06e1fb443a5cc28681b03e436fd.png)](https://gyazo.com/5ae0a06e1fb443a5cc28681b03e436fd)
  
# 画面遷移図

[![Image from Gyazo](https://i.gyazo.com/5678f824e25db228dcaa3adb281d305d.png)](https://gyazo.com/5678f824e25db228dcaa3adb281d305d)

# 開発環境
* フロントエンド  
* バックエンド  
* インフラ  
* テキストエディタ  
* タスク管理  

# ローカルでの動作方法
以下のコマンドを順に実行。  
% git clone https://github.com/Kosuke-13th/botanical-assist  
% cd botanical-assist  
% bundle install  
% yarn install  
  
  
# 工夫したポイント
* ログイン後、今日何をすればいいかが一目でわかるシンプルな表示にした。
* 植物登録時の情報はメモとして残すことができる。実体験を基に項目を設定した。
* スマホサイズにも対応している。スマホから写真をアップロードできる。
