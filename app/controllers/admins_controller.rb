class AdminsController < ApplicationController
  befire_action :authenticate_admin!

  #会員一覧画面
  def index
    @members = Member.page(params[:page])
  end
  #会員の詳細画面
  def show
    @member = Member.find(params[:id])
  end
　#会員の情報編集
  def edit
    @member = Member.find(params[:id])
  end
　#会員の情報更新
  def update
    @member = Member.find(params[:id])
    if @member = Member.update(member_params)
      redirect_to admin_member_path(@member)
    else
      render :edit
    end
  end

  private
  def member_params
    params.require(:member).permit(:email, :last_name, :first_name, :last_name_kana, :first_name_kana, :postal_code, :address, :telephone_number, :is_deleted)
  end
end
