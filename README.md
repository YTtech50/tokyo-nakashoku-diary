# アプリケーション名

東京ナカ食ダイアリー
Tokyo Nakashoku Diary 
 
# DEMO

* 完成版のGIFを載せる予定
 
# 概要

テイクアウトやデリバリーで食べた物の画像、評価、価格、摂取カロリーなどを記録できる。
自分の食生活の傾向を把握できるとともに、１か月毎に遣った総額も表示するので家計簿的にも使える。
他ユーザーの投稿も含め、お店、料理の情報を検索することが可能。
 
# 利用方法

・ユーザー登録すれば、自分の食べた物の情報を入力した記事を投稿できる
・ユーザー登録しなくても記事の検索ができる
・ユーザー登録しなくても、他のユーザーが投稿した記事、および他のユーザーのマイページを閲覧できる
・トップページの記事一覧から見たい記事の部分をクリックすると、詳細情報表示ページに遷移する
・ユーザーのマイページには、詳細情報ページの投稿者名をクリックすると遷移する
・ログインしている場合は、画面右上に表示された自分のユーザー名をクリックすると自分のマイページに遷移する
・ユーザー毎のマイページでは、月毎に食べた物、食べ物に使った金額がわかる
・記事はその投稿者に限り、詳細情報ページに表示されたボタンから削除・編集ができる

# 目指した課題解決

・よくテイクアウトやデリバリーを利用する人が、他の人の情報を参考にしながらより良い食生活を送れるようにする
・同時に支出の把握、コントロールをできるようにする

 
# Author 
* 高橋良行
* Yoshiyuki Takahashi
* y-taka@sa3.so-net.ne.jp

# URL

* 未デプロイ
 
# テーブル設計

## users テーブル

| Column         | Type   | Options     |
| -------------- | ------ | ----------- |
| name           | string | null: false | 
| email          | string | null: false |
| password       | string | null: false |
| favorite_food  | string |             |
| hate_food      | string |             |

### Association

- has_many :foods
- has_many :comments

## foods テーブル

| Column        | Type       | Options           |
| ------------- | ---------- | ----------------- |
| food_name     | string     | null: false       |
| restaurant    | string     | null: false       |
| category      | integer    | null: false       |
| price         | integer    | null: false       |
| business_form | integer    | null: false       |
| area          | integer    | null: false       |
| evaluation    | integer    | null: false       |
| calorie       | integer    | null: false       |
| review        | text       |                   |
| start_time    | date       | null: false       | 
| user_id       | references | foreign_key: true |

### Association

- belongs_to :user
- has_many :comments

## comments テーブル

| Column      | Type       | Options           |
| ----------- | ---------- | ----------------- |
| text        | text       | null: false       |
| user_id     | references | foreign_key: true |
| food_id     | references | foreign_key: true |

### Association

- belongs_to :user
- belongs_to :food
