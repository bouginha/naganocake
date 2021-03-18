class Admins::ProductsGenresController < ApplicationController
  def new
            @product_genre=Product_genre.new
        end
        def create
            @products_genre=Products_genre.new(product_params)
            if @product_genre.save
              redirect_to adminproducts_path
            else
              render :new
            end
        end
        def show
        end
        
        def index
            @products_genre=Product_genre.all
            
        end
        
        def edit
        end
        
        def destroy
        end
        
        def update
        end
     private   
        def product_params
          params.require(:product_genre).permit(:name,:about,:image,:normal_price,:products_genre_id,:is_active)
        end
end
