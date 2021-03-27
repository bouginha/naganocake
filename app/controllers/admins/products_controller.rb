class Admins::ProductsController < ApplicationController
  before_action :authenticate_admin!
        def new
            @product=Product.new
        end
        def create

              @product=Product.new(product_params)

            if @product.save
              redirect_to admins_product_path(@product)
            else

              render :new
            end
        end

        def show
          @product = Product.find(params[:id])
        end

        def index
            @product=Product.all

        end

        def edit
@product = Product.find(params[:id])
        end

        def destroy
        end

        def update
          @product = Product.find(params[:id])
          if @product.update(product_params)
            redirect_to admins_products_path
          else
            render :edit
          end
        end

     private

        def product_params
          params.require(:product).permit(:name,:about,:image,:normal_price,:products_genre_id,:is_active)
        end
end
