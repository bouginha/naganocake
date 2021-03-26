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
    #@ordered_product = OrderedProduct.find(@.ordered_product.id)
    @ordered_products = OrderedProduct.all
    @products=Product.all
  end

  def update
    #orderのorder_statusの更新
  	@order = Order.find(params[:id])
    @order.update(order_params)
    flash[:success] = "更新に成功しました"
  	redirect_to admins_order_path

  	#orderのproduct_statusの更新
  	@ordered_product = OrderProduct.find_by(order_id: @order.id)
    @ordered_product.update(product_status: params[:order][:product_status])
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
  	params.require(:order).permit(:order_status, :product_status)
  end



end
