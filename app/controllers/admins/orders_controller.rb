class Admins::OrdersController < ApplicationController
  before_action :authenticate_admin!

  def index
    if params[:member_id]
      @member = Member.find(params[:member_id])
      @orders = @member.orders.page(params[:page]).reverse_order
      @ordered_products=OrderedProduct.all
    else
      @orders = Order.all
    end
      #@ordered_product=OrderedProduct.find(params[:ordered_product_id])
      @ordered_products=OrderedProduct.all

  end

  def show
    @order = Order.find(params[:id])
    @member = Member.find(@order.member_id)
    @ordered_products = OrderedProduct.all
    @products=Product.all
  end

  def update

    if params[:order][:upd]=="1"
    	@order = Order.find(params[:id])
      @order.update(order_params)
          flash[:success] = "更新に成功しました"
    elsif params[:order][:upd]=="2"
      @ordered_product=OrderedProduct.find(params[:order][:ordered_product_id])
      @ordered_product.update(production_status: params[:order][:production_status])
    flash[:success] = "更新に成功しました"
    end

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
