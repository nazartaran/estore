class CreateComments < ActiveRecord::Migration
  def change
    create_table :user_comments do |t|
      t.integer :user_id
      t.integer :product_id
      t.text :user_comment
      t.integer :rate

      t.timestamps null: false
    end
  end
end
