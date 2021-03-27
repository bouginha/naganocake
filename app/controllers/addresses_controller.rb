class AddressesController < ApplicationController
  #ログインユーザーのみ閲覧可
  before_action :authenticate_member!
#退会済みユーザーは閲覧不可
  before_action :member_is_deleted
  def index
    @address = Address.new
    @addresses = Address.all
  end

  def create
    @address = Address.new(address_params)
    @address.member_id = current_member.id
    @address.save
    redirect_to addresses_path
  end

  def edit
    @address = Address.find(params[:id])
  end

  def update
    @address = Address.find(params[:id])
  	@address.update(address_params)
  	redirect_to addresses_path
  end

  def destroy
    @address = Address.find(params[:id])
  	@address.destroy
  	redirect_to addresses_path
  end

  private
  def address_params
  	params.require(:address).permit(:name, :member_id, :address, :postal_code)
  end
   #退会済みユーザーへの対応
    def member_is_deleted
      if member_signed_in? && current_member.is_deleted?
         redirect_to root_path
      end
    end
end
