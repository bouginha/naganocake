class Product < ApplicationRecord
    belongs_to :product_genre
   attachment :image
end
