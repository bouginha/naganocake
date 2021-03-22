class OrdersController < ApplicationController
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
end
