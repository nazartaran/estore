class AddQuantityToBusketProduct < ActiveRecord::Migration
  def change
    add_column :busket_products, :quantity, :integer, :after => :product_id
  end
end
