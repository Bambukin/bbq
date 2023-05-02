class UsersController < ApplicationController
  before_action :authenticate_user!, except: %i[ show ]
  before_action :set_current_user, except: %i[ show ]

  def show
    @user = User.find(params[:id])
  end

  def edit
  end

  def update
    if @user.update(user_params)
      redirect_to @user, notice: I18n.t('controllers.user.updated')
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private
    def set_current_user
      @user = current_user
    end

    def user_params
      params.require(:user).permit(:name, :email)
    end
end
