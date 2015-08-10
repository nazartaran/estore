class AddParentIdToProductComments < ActiveRecord::Migration
  def change
    add_column :product_comments, :parent_id, :int
  end
end
