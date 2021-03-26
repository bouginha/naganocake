class ChangeProductionStatusTOorderedProducts < ActiveRecord::Migration[5.2]
  def change
    change_column_null :ordered_products, :production_status, null: false, default: 0
    change_column :ordered_products, :production_status, :integer, default: 0
  end
end
