class ProductsGenresController < ApplicationController

  def show

    @products=Product.all
    @products_genre = ProductsGenre.find(params[:id])
    
  end

  def index
    @products=Product.all
    @products_genre = ProductsGenre.all
  end
  
  private

	
    def products_genre_params
      params.require(:products_genre).permit(:name)
    end 
    
    
end
