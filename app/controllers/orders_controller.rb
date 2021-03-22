class OrdersController < ApplicationController
  #管理者とログインユーザーのみ閲覧可
	before_action :authenticate!
#退会済みユーザーは閲覧不可
 	before_action :member_is_deleted
#param[:id]が取得できない場合、閲覧不可
 	before_action :params_check, only: [:index]
  def index
    @orders = Order.all
  end

  def show
  end

  def confirm
  end

  def create
    @order = Order.new(member_id: @member.id)
    if @order.save 
    else
    end
  end

  def new
    @cart_products=current_member.cart_products
    @order=Order.new
    @member = current_member
		if @member.cart_products.blank?
 		    flash[:warning] = "カートが空です"
			redirect_to cart_products_path
		else
			@order = Order.new(member_id: @member.id)

			@add = current_member.addresses

			@addresses = Address.new(member_id: @member.id)
		end
  end

  def thanks
  end

  #退会済みユーザーへの対応
    def member_is_deleted
      if member_signed_in? && current_member.is_deleted?
         redirect_to root_path
      end
    end

#adminでなければuserの中で振り分ける
    def authenticate!
      if admin_signed_in?
      else
      	authenticate_member!
      end
    end

#ordersと直打ちした場合
    def params_check
    	if params[:id].nil?
    		redirect_to root_path
    	end
    end
end
