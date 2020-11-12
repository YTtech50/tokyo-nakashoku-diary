# Name

東京ナカ食ダイアリー
Tokyo Nakashoku Diary 
 
# DEMO

魅力が直感的に伝えわるデモ動画や図解を載せる
 
# Features

テイクアウトやデリバリーで食べた物の画像、評価、価格、摂取カロリーなどを記録できる。
自分の食生活の傾向を把握できるとともに、１か月毎に遣った総額も表示するので家計簿的にも使える。
他ユーザーの投稿も含め、お店、料理の情報を検索することが可能。
 
# Usage

基本的な使い方を説明する
 
# Author 
* 高橋良行
* Yoshiyuki Takahashi
* y-taka@sa3.so-net.ne.jp
 
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
