class RemoveIsPaidFromBusket < ActiveRecord::Migration
  def change
    remove_column :buskets, :is_paid, :boolean
  end
end
