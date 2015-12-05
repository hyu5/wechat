class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def after_sign_in_path_for(resource)
    if resource.class == User
      root_path
    elsif resource.class == Admin
      home_admin_path
    end
  end

  def after_sign_up_path_for(resource)
    if resource.class == User
      signed_in_root_path
    elsif resource.class == Admin
      signed_in_home_admin_path
    end
  end

  def after_update_path_for(resource)
    if resource.class == User
      signed_in_root_path
    elsif resource.class == Admin
      signed_in_home_admin_path
    end
  end

  def after_resetting_password_path_for(resource)
    if resource.class == User
      signed_in_root_path
    elsif resource.class == Admin
      signed_in_home_admin_path
    end
  end

  def after_sign_out_path_for(resource)
    request.referrer
  end

end

