class CreateBusketProducts < ActiveRecord::Migration
  def change
    create_table :busket_products do |t|
      t.integer :busket_id
      t.integer :product_id

      t.timestamps null: false
    end
  end
end
