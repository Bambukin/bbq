class ApplicationController < ActionController::Base
  helper_method :current_user_can_edit?

  def current_user_can_edit?(event)
    user_signed_in? && event.user == current_user
  end
end
