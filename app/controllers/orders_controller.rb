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
  			# params[:order][:address_op]
  		@order=Order.new
  		@order.payment_method = params[:payment_method]
		@member = current_member
		@ads = @member.addresses
			# binding.pry
			if params[:address_op]	== "1"
				@order.address = @member.address
				@order.postal_code = @member.postal_code
			elsif params[:address_op] == "2"
				# @ad = @ads.find(params[:Address][:id])
				# @order.address = @ad.address

				# @order.postal_code = @ad.postal_code
			elsif params[:address_op] == "3"
				# #addressテーブルに保存させる
				# @ad = Address.new
				# @ad.member_id = @member.id
				# # @ad.address = params[:address_op][:address]
				# # @ad.name = params[:address][:name]

				# @ad.postal_code = params[:address_op][:postal_code]
				# # @ad.phone = params[:address][:telephone]
				# @ad.save

				# @order.address = params[:address_op][:address]

				# @order.postal_code = params[:address_op][:postal_code]
			end
			render :confirm
			
	

  end

  def create
    # 情報の保存

		if @order.save
			redirect_to orders_path
		else
			# binding.pry
				redirect_to products_path
		# render :refere
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
	 	params.require(:order).permit(
	 		:member_id, :payment_method, :address, :postal_code,
	 		address:[:postal_code, :address, :name, :member_is]
	 		)    
    end
end
