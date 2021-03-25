class Address < ApplicationRecord
  # アソシエーション
  belongs_to :member
  
  # バリデーション
  validates :postal_code, :address, :name, presence: true


end
