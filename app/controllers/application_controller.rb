class ApplicationController < ActionController::Base
  # before_action :configure_permitted_parameters, if: :devise_controller?
  #
  # def configure_permitted_parameters
  #   devise_parameter_sanitizer.for(:account_update) do |u|
  #     u.permit(:password, :password_confirmation, :current_password)
  #   end
  # end

  helper_method :current_user_can_edit?

  def current_user_can_edit?(event)
    user_signed_in? && event.user == current_user
  end
end
