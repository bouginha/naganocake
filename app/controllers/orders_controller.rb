class OrdersController < ApplicationController
  #管理者とログインユーザーのみ閲覧可
	before_action :authenticate!
#退会済みユーザーは閲覧不可
 	before_action :member_is_deleted

  def index
    @orders = current_member.orders
  end

  def show
  	@order = Order.find(params[:id])
    @ordered_products = @order.ordered_products
  end

  def confirm
  			# params[:order][:address_op]
    @order=Order.new(order_params)

		@member = current_member

		@ads = @member.addresses
	    @cart_products=current_member.cart_products
		
	
		# @items = Order.billing_amount

		#ordered_itemにデータ挿入
			# item = []
			# @items = @member.cart_products
			# 	@items.each do |i|
			# 		item << @order.ordered_items.build(product_id: i.product_id, price: i.price, quantity: i.quantity, product_status: 1)
			# 	end
			# OrderedItem.import item


		@ads = @member.addresses
		#@orderparams = Order.find(params[:id])
		# @items = @orderparams.ordered_items

		#ordered_itemにデータ挿入

			if params[:order][:address_op]	== "1"
				@order.address = @member.address
				@order.postal_code = @member.postal_code
				@order.delivery_name = @member.first_name+@member.last_name
			elsif params[:order][:address_op] == "2"
				@ad = @ads.find(params[:Address][:id])
				@order.address = @ad.address
				@order.postal_code = @ad.postal_code
				@order.delivery_name = @member.name
			elsif params[:order][:address_op] == "3"
				# #addressテーブルに保存させる
				@ad = Address.new
				@ad.member_id = @member.id
				# @ad.address = params[:address_op][:address]
				# @ad.name = params[:address][:name]

				@ad.postal_code = params[:address_op][:postal_code]
				# @ad.phone = params[:address][:telephone]
				@ad.save

				# @order.address = params[:address_op][:address]

				# @order.postal_code = params[:address_op][:postal_code]
			end
	
  end

  def create
    # 情報の保存

    @order = Order.new(order_params)

    if @order.save
		redirect_to order_thanks_path
	else
		render :confirm
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
    
    private

    def order_params
	 	params.require(:order).permit(:member_id, :payment_method, :address, :postal_code,:delivery_name,:billing_amount,:shipping_cost,:received_status)
    end
end
