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

      if @order.order_status=="入金確認"
        @ordered_products=OrderedProduct.where(order_id: params[:id])

  		    for s in @ordered_products do
           s.update(production_status: "製作待ち")
          end

      end

      flash[:success] = "更新に成功しました"

    elsif params[:order][:upd]=="2"
      @ordered_products=OrderedProduct.where(order_id: params[:id])
      @ordered_product=OrderedProduct.find(params[:order][:ordered_product_id])
      @ordered_product.update(production_status: params[:order][:production_status])

      if @ordered_products.size==@ordered_products.production_status_製作完了.size
        @order = Order.find(params[:id])
        @order.update(order_status: "発送待ち")

      elsif @ordered_product.production_status=="製作中"
        @order = Order.find(params[:id])
        @order.update(order_status: "製作中")

      end

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
