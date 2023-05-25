module EventHelper
  def is_subscriber?
    @event.subscribers.include?(current_user)
  end
end
