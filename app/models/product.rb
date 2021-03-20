class Product < ApplicationRecord
    belongs_to :products_genre
   attachment :image
   validates :name, presence: true
   validates :about, presence: true
   validates :image, presence: true
   validates :normal_price, presence: true
   validates :products_genre_id, presence: true

end
