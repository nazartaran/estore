class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :name
      t.text :description
      t.integer :category_id
      t.decimal :price, precision: 10, scale: 2
      t.attachment :image

      t.timestamps null: false
    end
  end
end
