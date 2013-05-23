class Event < ActiveRecord::Base
  has_many :event_photos
  attr_accessible :description, :event_date, :name, :event_photos

  def cover_photo
    self.event_photos.where(:is_cover => true).first
  end

end
