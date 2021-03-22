class Admins::OrdersController < ApplicationController
  before_action :authenticate_admin!

  def index
    if params[:day]
      @orders = Order.created_today
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
