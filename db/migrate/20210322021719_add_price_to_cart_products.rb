class AddPriceToCartProducts < ActiveRecord::Migration[5.2]
  def change
    add_column :cart_products, :price, :integer
  end
end
