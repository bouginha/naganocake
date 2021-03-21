class MembersController < ApplicationController


  def show

    @member = current_member

  end

  def edit
    @member = current_member
  end

  def update
    @member = current_member
    if @member.update(member_params)
       redirect_to member_path
    else
      render :edit
    end
  end

  def unsubscribe
    @member = current_member
  end

  def withdraw
    @member = Member.find(params[:id])
        #is_deletedカラムにフラグを立てる(defaultはfalse)
        @member.update(is_deleted: true)
        #ログアウトさせる
        reset_session
        flash[:notice] = "ありがとうございました。またのご利用を心よりお待ちしております。"
        redirect_to root_path
  end

  private
  def member_params
   	params.require(:member).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :postal_code, :address, :telephone_number, :is_deleted, :email)
  end

end
