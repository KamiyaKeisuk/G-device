class CreateDevices < ActiveRecord::Migration[5.2]
  def change
    create_table :devices do |t|
      t.integer :category_id, null: false
      t.integer :maker_id, null: false
      t.string :name, null: false
      t.text :description, null: false
      t.integer :price, null: false
      t.string :image_id, null: false

      t.timestamps
    end
  end
end
