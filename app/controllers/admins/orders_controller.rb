class Admins::OrdersController < ApplicationController
  before_action :authenticate_admin!

  def index
    if params[:member_id]
       @member = Member.find(params[:member_id])
       @orders = @member.orders.page(params[:page]).reverse_order
       @ordered_products=OrderedProduct.all
       else
       @orders = Order.all
      # @ordered_product=OrderedProduct.new(CartProduct.find())
    end
    @ordered_products=OrderedProduct.all
  
  end

  def show
    @order = Order.find(params[:id])

    @member = Member.find(@order.member_id)
    @ordered_products=OrderedProduct.all
    @products=Product.all
  end

  def update
#orderのorder_statusの更新

  	@order = Order.find(params[:id])
    @ordered_product=OrderedProduct.find_by(order_id: @order.id) 

      @order.update(order_params)
      @ordered_product.update(production_status: params[:order][:production_status])
      flash[:success] = "更新に成功しました"
    	redirect_to admins_order_path
    
  end

  def confirm
  end

  def create
  end

  def new
  end

  def thanks
  end

  private
  def order_params
  	params.require(:order).permit(:order_status)
  end



end
