class PhotoSave
  attr_reader :photo

  def self.call(photo)
    new(photo).call
  end

  def initialize(photo)
    @photo = photo
  end

  def call
    if photo.save
      photo.photo.analyze
      NotifySubscribersJob.perform_later(photo)
      true
    else
      false
    end
  end
end
