class HomesController < ApplicationController


  def top
  	@Products = Product.where("created_at >= ?", Date.today)
  	@count = @Products.count
  end
end
