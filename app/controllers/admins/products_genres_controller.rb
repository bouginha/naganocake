class Admins::ProductsGenresController < ApplicationController
  before_action :authenticate_admin!
        def new

          @products_genre=ProductsGenre.new
        end
        def create

            @products_genre_new=ProductsGenre.new(products_genre_params)
            if @products_genre_new.save
              redirect_to admins_products_genres_path
            else
              @products_genre=ProductsGenre.all
              binding.pry
              render :index
            end
        end

        def show
        end

        def index
          @products_genre_new=ProductsGenre.new
          @products_genre=ProductsGenre.all
        end

        def edit
          @products_genre = ProductsGenre.find(params[:id])

        end

        def update
              @products_genre = ProductsGenre.find(params[:id])
            if @products_genre.update(products_genre_params)
              redirect_to admins_products_genres_path
            else
              @products_genre = ProductsGenre.find(params[:id])
              render :edit
            end
        end

     private
        def products_genre_params
          params.require(:products_genre).permit(:name)
        end
end
