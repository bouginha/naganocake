class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.integer :products_genre_id
      t.string :name
      t.string :about
      t.string :image_id
      t.integer :normal_price
      t.boolean :is_active

      t.timestamps
    end
  end
end
