class Admins::ProductsController < ApplicationController
        def new
            @product=Product.new
        end
        def create
   
              @product=Product.new(product_params)

            if @product.save
              redirect_to admins_products_path
            else

              render :new
            end
        end
        
        def show
        end
        
        def index
            @product=Product.all
            
        end
        
        def edit
        end
        
        def destroy
        end
        
        def update
        end
     private   
        def product_params
          params.require(:product).permit(:name,:about,:image,:normal_price,:products_genre_id,:is_active)
        end
end
