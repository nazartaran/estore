class CreateBuskets < ActiveRecord::Migration
  def change
    create_table :buskets do |t|
      t.integer :user_id
      t.boolean :is_paid
      t.date :expiration_time

      t.timestamps null: false
    end
  end
end
