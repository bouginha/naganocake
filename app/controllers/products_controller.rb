class ProductsController < ApplicationController
  def show
    @products=Product.find(product_params)

    
  end

  def index
    @products=Product.all
    @products_genre = ProductsGenre.all
  end
  
  private   
    def product_params
      params.require(:product).permit(:name,:about,:image,:normal_price,:products_genre_id,:is_active)
    end
end
