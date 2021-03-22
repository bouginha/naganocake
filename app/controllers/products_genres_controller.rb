class ProductsGenresController < ApplicationController

  #ログインユーザーのみproduct#indexは閲覧可
  before_action :authenticate!, except: [:index, :show]
#退会済みユーザー
  before_action :member_is_deleted, except: [:index, :show]

  def show

    @products=Product.all
    @products_genre = ProductsGenre.find(params[:id])

  end

  def index
    @products=Product.all
    @products_genre = ProductsGenre.all
  end

  private


    def products_genre_params
      params.require(:products_genre).permit(:name)
    end

    #退会済みユーザーへの対応
    def member_is_deleted
      if member_signed_in? && current_member.is_deleted?
         redirect_to root_path
      end
    end


end
