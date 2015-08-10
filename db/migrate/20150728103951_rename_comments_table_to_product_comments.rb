class RenameCommentsTableToProductComments < ActiveRecord::Migration
  def change
    rename_table :comments, :product_comments
  end
end
