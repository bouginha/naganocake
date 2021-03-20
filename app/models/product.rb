class Product < ApplicationRecord
    belongs_to :products_genre
   attachment :image
end
