class ProductsController < ApplicationController

  #ログインユーザーのみproduct#indexは閲覧可
  before_action :authenticate!, except: [:index, :show]
#退会済みユーザー
  before_action :member_is_deleted, except: [:index, :show]

  def show

    @cart_product = CartProduct.new
    @products_genre = ProductsGenre.all
    @product = Product.find(params[:id])

  end

  def index
    @products=Product.all
    @products_genre = ProductsGenre.all
  end

  private
    def product_params
      params.require(:product).permit(:name,:about,:image,:normal_price,:products_genre_id,:is_active)
    end



  #adminでなければuserの中で振り分ける
    def authenticate!
      if admin_signed_in?
      else
      	authenticate_member!
      end
    end

#退会済みユーザーへの対応
    def member_is_deleted
      if member_signed_in? && current_member.is_deleted?
         redirect_to root_path
      end
    end
end
