class Admins::ProductsGenresController < ApplicationController
  def new
            @product_genre=Product_genre.new
        end
        def create
            @products_genre=ProductsGenre.new(product_params)
            if @product_genre.save
              redirect_to admin_products_genre_index_path
              else
              render :new
            end
        end
        def show
        end

        def index
            @products_genre=ProductGenre.all

        end

        def edit
          @products_genre = ProductsGenre.find(params[:id])
        end

        def destroy
        end

        def update
        end
     private
        def product_params
          params.require(:product_genre).permit(:name)
        end
end
