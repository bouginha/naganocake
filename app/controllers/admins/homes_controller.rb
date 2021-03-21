class Admins::HomesController < ApplicationController
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
