class HomesController < ApplicationController
  #非ログインユーザーも閲覧可


  def top
  	@Products = Product.where("created_at >= ?", Date.today)
  	@count = @Products.count
  end

  def about
  end

end
