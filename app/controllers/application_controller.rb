class ApplicationController < ActionController::Base

  def after_sign_in_path_for(resource)
    case resource
    when Admin
      admins_homes_top_path          #pathは設定したい遷移先へのpathを指定してください
    when Member
      homes_top_path              #ここもpathはご自由に変更してください
    end
  end

  def after_sign_out_path_for(resource_or_scope)
    if resource_or_scope == :admin
      admin_session_path
    else
      homes_top_path
    end
  end
end
