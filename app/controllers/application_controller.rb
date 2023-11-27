class ApplicationController < ActionController::Base
  before_action :authenticate_user!, except: [:top, :about]#ログインしないとtopページ以外に遷移できない
  before_action :configure_permitted_parameters, if: :devise_controller?

  def after_sign_in_path_for(_resource)
    subjects_top_path
  end

  def after_sign_in_path_for(_resource)
    subjects_top_path
  end
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :gender, :email, :encrypted_password])
  end
end
