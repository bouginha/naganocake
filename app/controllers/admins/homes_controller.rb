class Admins::HomesController < ApplicationController
  before_action :authenticate_admin!
    def top
    end

    def index
    if params[:day]
      @orders = Order.created_today
    else
  	   @orders = Order.all
    end
    end

end
