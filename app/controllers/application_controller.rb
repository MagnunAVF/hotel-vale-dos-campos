class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

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
end
