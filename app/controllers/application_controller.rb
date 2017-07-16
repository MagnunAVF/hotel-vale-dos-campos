class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?

  def after_sign_in_path_for(resource)
    if current_user.type == "Employee"
      employee_home_path
    else
      user_home_path
    end
  end

  def after_sign_out_path_for(resource)
    home_path
  end

  protected
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :cpf, :address, :birthday, :email, :fone, :type])
  end
end
