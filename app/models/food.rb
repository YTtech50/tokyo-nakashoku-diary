class Food < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  has_many :comments

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :area
  belongs_to_active_hash :business_form
  belongs_to_active_hash :evaluation

  validates :food_name, :restaurant, :category, :area, :business_form, :evaluation, :start_time, :price, presence: true
  validates :category_id, numericality: { other_than: 1 }
  validates :area_id, numericality: { other_than: 1 }
  validates :business_form_id, numericality: { other_than: 1 }
  validates :evaluation_id, numericality: { other_than: 1 }
  validates :price, numericality: { greater_than: 0, less_than: 9_999_999 }
  validates :price, format: { with: /\A[0-9]+\z/ }

  def self.search(search)
    if search != ""
      Food.where('food_name LIKE(?)', "%#{search}%")
    end
  end
end
