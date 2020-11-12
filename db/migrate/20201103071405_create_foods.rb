class CreateFoods < ActiveRecord::Migration[6.0]
  def change
    create_table :foods do |t|
      t.string :food_name, null: false
      t.string :restaurant, null: false
      t.text :review
      t.integer :category_id, null: false
      t.integer :area_id, null: false
      t.integer :business_form_id, null: false
      t.integer :evaluation_id, null: false
      t.integer :price, null: false
      t.integer :calorie
      t.references :user, foreign_key: true
      t.timestamps
    end
  end
end
