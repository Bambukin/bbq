class PhotosController < ApplicationController
  before_action :set_event, only: %i[create destroy]
  before_action :set_photo, only: %i[destroy]
  after_action :verify_authorized, only: %i[create destroy]

  def create
    @new_photo = @event.photos.build(photo_params)
    @new_photo.user = current_user
    authorize @new_photo

    if PhotoSave.call(@new_photo)
      redirect_to @event, notice: I18n.t('controllers.photos.created')
    else
      render 'events/show', alert: I18n.t('controllers.photos.error')
    end
  end

  def destroy
    authorize @photo
    @photo.destroy

    redirect_to @event, notice: I18n.t('controllers.photos.destroyed')
  end

  private

  def set_event
    @event = Event.find(params[:event_id])
  end

  def set_photo
    @photo = @event.photos.find(params[:id])
  end

  def photo_params
    params.fetch(:photo, {}).permit(:photo)
  end
end
