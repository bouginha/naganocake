class Admins::ProductsGenresController < ApplicationController
        def new
  
            @products_genre=ProductsGenre.new
        end
        def create

            @products_genre=ProductsGenre.new(products_genre_params)
            if @products_genre.save
              redirect_to products_genres_path
            else
              render :new
            end
        end
        def show
        end
        
        def index
            @products_genre=ProductsGenre.all
            
        end
        
        def edit
        end
        
        def destroy
        end
        
        def update
        end
     private   
        def products_genre_params
          params.require(:product_genre).permit(:name)
        end
end
