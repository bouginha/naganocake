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
    @ordered_products = OrderedProduct.all
  end

  def confirm

    @order=Order.new(order_params)
  	@member = current_member
  	@ads = @member.addresses
  	@cart_products=current_member.cart_products
  	@ads = @member.addresses

		if params[:order][:address_op]	== "1"
			@order.address = @member.address
			@order.postal_code = @member.postal_code
			@order.delivery_name = @member.first_name+@member.last_name
		elsif params[:order][:address_op] == "2"
			@ad = Address.find_by(address: @order.address)
			@order.postal_code = @ad.postal_code
			@order.delivery_name = @ad.name
		elsif params[:order][:address_op] == "3"
			#addressテーブルに保存させる
			@ad = Address.new
      @ad.member_id = @member.id
			@ad.address = params[:order][:address_new]
			@order.address = @ad.address
			@ad.name = @order.delivery_name
			@ad.postal_code = @order.postal_code
			@ad.save
		end

  end

 # 情報の保存
  def create
    @order = Order.new(order_params)
    if @order.save && @order.desired_delivery_date > (Date.today+ 2.day)

    @cart_products = current_member.cart_products

    @cart_products.each do |cart_product|
      @ordered_product=OrderedProduct.new
      @ordered_product.product_id=cart_product.product_id
      @ordered_product.order_id=@order.id
      @ordered_product.quantity=cart_product.quantity
      @ordered_product.price=cart_product.price
      @ordered_product.production_status=0
      @ordered_product.save
    end


    @cart_products.destroy_all
		redirect_to order_thanks_path
	  else
	  flash[:warning] = "配達希望日には今日の日付より三日以降を指定してください"
	  @member = current_member
  	@ads = @member.addresses
  	@cart_products=current_member.cart_products
  	@ads = @member.addresses
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
	 	params.require(:order).permit(:member_id, :payment_method, :address, :postal_code,:delivery_name,:billing_amount,:shipping_cost,:desired_delivery_date)
    end
    # def address_params
    #     params.require(:address).permit(:member_id,:name,:address,:postal_code)
    # end
end