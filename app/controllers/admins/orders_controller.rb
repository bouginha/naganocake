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
    @items = @order.ordered_items
  end

  def confirm
  end

  def create
  end

  def new
  end

  def thanks
  end
end
