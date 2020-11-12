class Comment < ApplicationRecord
  belongs_to :food  # foodsテーブルとのアソシエーション
  belongs_to :user  # usersテーブルとのアソシエーション
end
