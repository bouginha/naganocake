class Product < ApplicationRecord
    belongs_to :products_genre
    has_many :cart_products
    has_many :ordered_product
   attachment :image
   validates :name, presence: true
   validates :about, presence: true
   validates :image, presence: true
   validates :normal_price, presence: true,numericality: {only_integer: true}
   validates :products_genre_id, presence: true

   # 今日投稿された Product を取得
  #scope :created_today, -> { where(created_at: Time.zone.now.all_day) }

end
