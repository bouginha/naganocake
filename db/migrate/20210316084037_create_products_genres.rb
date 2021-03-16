class CreateProductsGenres < ActiveRecord::Migration[5.2]
  def change
    create_table :products_genres do |t|
      t.string :name

      t.timestamps
    end
  end
end
