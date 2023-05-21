class ApplicationController < ActionController::Base
  helper_method :current_user_can_edit?

  def current_user_can_edit?(model)
    user_signed_in? &&
      (model.user == current_user || (model.try(:event).present? && model.event.user == current_user))
  end

  def notify_subscribers(object)
    all_emails = (object.event.subscriptions.map(&:user_email) + [object.event.user.email] - [current_user&.email])

    if object.is_a?(Photo)
      all_emails.each do |mail|
        EventMailer.photo(object, mail).deliver_later
      end
    else
      all_emails.each do |mail|
        EventMailer.comment(object, mail).deliver_later
      end
    end
  end
end
