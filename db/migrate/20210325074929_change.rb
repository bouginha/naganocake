class Change < ActiveRecord::Migration[5.2]
  def change
    change_column_null :orders, :order_status, null: false, default: 0
    change_column :orders, :order_status, :integer, default: 0
  end
end
