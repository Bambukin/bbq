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
      NotifySubscribers.(photo)
      true
    else
      false
    end
  end
end
