class Admins::OrdersController < ApplicationController
  before_action :authenticate_admin!

  def index
    @path = Rails.application.routes.recognize_path(request.referer)

    if @path[:action] == "show"
      @member = Member.find(@path[:id])
      @orders = @member.orders.page(params[:page])
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
