class ProductsGenre < ApplicationRecord
   has_many :products 
 enum products_genre_id: { "ケーキ": 0, "プリン": 1, "焼き菓子": 2, "キャンディ": 3 }
end
