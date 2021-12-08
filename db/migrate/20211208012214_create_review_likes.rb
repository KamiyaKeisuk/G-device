class CreateReviewLikes < ActiveRecord::Migration[5.2]
  def change
    create_table :review_likes do |t|
      t.integer :customer_id, null: false
      t.integer :review_id, null: false

      t.timestamps
    end
  end
end
