class ApplicationController < ActionController::Base
  #before_action :authenticate_user!,except: [:top,:about]
  before_action :configure_permitted_parameters, if: :devise_controller?

  def after_sign_in_path_for(resource)
    if customer_signed_in?
      customer_path(resource)
    else
      admin_orders_path
    end
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:family_name, :first_name, :family_name_kana, :first_name_kana, :email, :postal_code, :address, :phone_number])
    devise_parameter_sanitizer.permit(:sign_in, keys: [:email]) # ログイン時はemailを使用
  end
  #protect_from_forgery with: :exception
end
