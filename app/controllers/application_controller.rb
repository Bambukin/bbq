class ApplicationController < ActionController::Base
  helper_method :current_user_can_edit?

  if Rails.env.development?
    before_action do
      ActiveStorage::Current.url_options = { protocol: request.protocol, host: request.host, port: request.port }
    end
  end

  def current_user_can_edit?(model)
    user_signed_in? &&
      (model.user == current_user || (model.try(:event).present? && model.event.user == current_user))
  end

  def notify_subscribers(event, object)
    all_emails = (event.subscriptions.map(&:user_email) + [event.user.email] - [current_user&.email])

    if object.class.name == 'Photo'
      all_emails.each do |mail|
        EventMailer.photo(event, object, mail).deliver_later
      end
    else
      all_emails.each do |mail|
        EventMailer.comment(event, object, mail).deliver_later
      end
    end
  end
end
