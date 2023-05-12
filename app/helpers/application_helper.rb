module ApplicationHelper
  def user_avatar(user)
    if user.avatar.attached?
        user.avatar.variant(:thumb)
    else
      asset_path('user.png')
    end
  end

  def user_avatar_thumb(user)
    if user.avatar.attached?
      user.avatar.variant(:thumb)
    else
      asset_path('user.png')
    end
  end

  def event_photo(event)
    photos = event.photos.persisted

    if photos.any?
      photos.sample.photo.url
    else
      asset_path('event.jpg')
    end
  end

  def event_photo_thumb(event)
    photos = event.photos.persisted

    if photos.any?
      photos.sample.photo.variant(:thumb).url
    else
      asset_path('event.jpg')
    end
  end

  def flash_class(level)
    case level.to_sym
    when :notice then 'alert-success'
    when :success then 'alert-success'
    when :error then 'alert-danger'
    when :alert then 'alert-danger'
    end
  end
end
