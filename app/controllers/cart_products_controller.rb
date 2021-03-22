class CartProductsController < ApplicationController
  #ログインユーザーのみ閲覧可
  before_action :authenticate_member!
#退会済みユーザーは閲覧不可
  before_action :member_is_deleted
  def index
    @cart_products=current_member.cart_products
    # @cart_product = CartProduct.new(cart_product_params)
  end

  def create
    @cart_product=CartProduct.new(cart_product_params)
    if @cart_product.save

      redirect_to cart_products_path
    else
     flash[:notice] = '個数を入力してください'
      redirect_to request.referer
    end
  end

  def update
        @cart_product=CartProduct.find(params[:id])
    if @cart_product.update

      redirect_to cart_products_path
    else

      redirect_to request.referer
    end
  end

  def destroy
    @cart_product = CartProduct.find(params[:id])
  	@cart_product.destroy
    redirect_to cart_products_path
  end

  def all_destroy
    @cart_product = current_member.cart_products
    @cart_product.destroy_all
    redirect_to cart_products_path
  end

    private
    def cart_product_params
      params.require(:cart_product).permit(:product_id,:member_id,:quantity,:price)
    end

     #退会済みユーザーへの対応
    def member_is_deleted
      if member_signed_in? && current_member.is_deleted?
         redirect_to root_path
      end
    end

end
