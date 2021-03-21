class AddressesController < ApplicationController
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
end
