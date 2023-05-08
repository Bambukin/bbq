module ApplicationHelper
  def user_avatar(user)
    asset_path('user.png')
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
