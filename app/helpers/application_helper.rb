module ApplicationHelper
  def user_avatar(user)
    if user.avatar?
      user.avatar.url
    else
      asset_path('user.png')
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
