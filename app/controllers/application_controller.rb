class ApplicationController < ActionController::Base
#before_action :authenticate_any!

#def authenticate_any!
    #if admin_signed_in?
        #true
    #else
        #authenticate_member!
    #end
#end


before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:password, :last_name, :first_name, :last_name_kana, :first_name_kana, :postal_code, :address, :telephone_number])
  end

  

  def after_sign_in_path_for(resource)
    case resource
    when Admin
      admins_orders_path          #pathは設定したい遷移先へのpathを指定してください
    when Member
      root_path              #ここもpathはご自由に変更してください
    end
  end



  def after_sign_out_path_for(resource_or_scope)
    if resource_or_scope == :admin
      admin_session_path
    else
      root_path
    end
  end

end
