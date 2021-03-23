class OrdersController < ApplicationController
  #管理者とログインユーザーのみ閲覧可
	before_action :authenticate!
#退会済みユーザーは閲覧不可
 	before_action :member_is_deleted

  def index
    @orders = Order.all
  end

  def show
  end

  def confirm
  end

  def create
    # 情報の保存
		@order = Order.new(order_params)
		@member = current_member
		@ads = @member.addresses
			if params[:_add] == "membersAdd"
				@order.address = @member.address
				@order.last_name = @member.last_name
				@order.first_name = @member.first_name
				@order.last_name_kana = @member.last_name_kana
				@order.first_name_kana = @member.first_name_kana
				@order.postal_code = @member.postal_code
			elsif params[:_add] == "Adds"
				@ad = @ads.find(params[:ShipToAddress][:id])
				@order.address = @ad.address
				@order.last_name = @ad.last_name
				@order.first_name = @ad.first_name
				@order.last_name_kana = @ad.last_name_kana
				@order.first_name_kana = @ad.first_name_kana
				@order.postal_code = @ad.postal_code
			elsif params[:_add] == "newAdd"
			#addressテーブルに保存させる
				@ad = ShipToAddress.new
				@ad.member_id = @member.id
				@ad.address = params[:ship_to_address][:address]
				@ad.last_name = params[:ship_to_address][:last_name]
				@ad.first_name = params[:ship_to_address][:first_name]
				@ad.last_name_kana = params[:ship_to_address][:last_name_kana]
				@ad.first_name_kana = params[:ship_to_address][:first_name_kana]
				@ad.postal_code = params[:ship_to_address][:postal_code]
				@ad.phone = params[:ship_to_address][:phone]
				@ad.save

				@order.ship_address = params[:ship_to_address][:address]
				@order.last_name = params[:ship_to_address][:last_name]
				@order.first_name = params[:ship_to_address][:first_name]
				@order.last_name_kana = params[:ship_to_address][:last_name_kana]
				@order.first_name_kana = params[:ship_to_address][:first_name_kana]
				@order.postal_code = params[:ship_to_address][:postal_code]
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
