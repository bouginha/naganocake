class Admins::OrderedProductsController < ApplicationController
    before_action :authenticate_admin!

  def update
    @ordered_product = OrderedProduct.find(params[:id])
      if @ordered_product.update(ordered_product_params)
        flash[:success] = "製作ステータスが変更されました"
        redirect_to admins_order_path(@ordered_product.order)
      else
        render "show"
      end
  end


  private
    def ordered_product_params
      params.require(:ordered_product).permit(:produciton_status)
    end
end
