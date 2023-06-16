class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def github
    @user = User.find_for_oauth(request.env['omniauth.auth'])

    if @user.persisted?
      flash[:notice] = I18n.t('devise.omniauth_callbacks.success', kind: 'Github')

      sign_in_and_redirect @user, event: :require_no_authentication
    else
      flash[:error] = I18n.t('devise.omniauth_callbacks.failure', kind: 'Github', reason: 'authentication error')

      redirect_to new_user_registration_path
    end
  end

  def vkontakte
    @user = User.find_for_oauth(request.env['omniauth.auth'])

    if @user.persisted?
      flash[:notice] = I18n.t('devise.omniauth_callbacks.success', kind: 'Vkontakte')

      sign_in_and_redirect @user, event: :require_no_authentication
    else
      flash[:error] = I18n.t('devise.omniauth_callbacks.failure', kind: 'Vkontakte', reason: 'authentication error')

      redirect_to new_user_registration_path
    end
  end
end
