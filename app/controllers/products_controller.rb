class ProductsController < ApplicationController
  def show
  end

  def index
    @products=Product.all
    @products_genre = ProductsGenre.all
  end
  
  private
  
  def product_params
		params.require(:product).permit(:image_id, :name, :about)
	end
  
end
