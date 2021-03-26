class Order < ApplicationRecord
  belongs_to :member
  has_many :ordered_products, dependent: :destroy

  def product_sum
	  total = 0
	  ordered_products.each do |order_product|
		  total += order_product.subtotal_price
	  end
	total
  end
end