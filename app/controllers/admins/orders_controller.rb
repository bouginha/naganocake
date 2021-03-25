class Admins::OrdersController < ApplicationController
  before_action :authenticate_admin!

  def index
    if params[:member_id]
       @member = Member.find(params[:member_id])
       @orders = @member.orders.page(params[:page]).reverse_order
    else
       @orders = Order.all
    end
  end

  def show
    @order = Order.find(params[:id])
    @member = Member.find(params[:id])
    #@items = @order.ordered_items
  end

  def update
#orderのorder_statusの更新
  	@order = Order.find(params[:id])
    @order.update(order_params)
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
  	params.require(:order).permit(:order_status,)
  end

end
