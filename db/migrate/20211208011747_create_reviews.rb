class CreateReviews < ActiveRecord::Migration[5.2]
  def change
    create_table :reviews do |t|
      t.integer :customer_id, null: false
      t.integer :device_id, null: false
      t.string :title, null: false
      t.text :comment, null: false
      t.float :rate, null: false
      t.string :image_id

      t.timestamps
    end
  end
end
