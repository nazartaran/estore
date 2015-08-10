class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.integer :sum
      t.integer :user_id
      t.string :ordered_products

      t.timestamps null: false
    end
  end
end
