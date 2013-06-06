class Event < ActiveRecord::Base
  has_many :event_photos
  attr_accessible :description, :event_date, :name,
  :cover_file_name, :cover_content_type, :cover_binary_data, :cover_image_file,
  :event_photos

  def cover_image_file=(input_data)
    self.cover_file_name = input_data.original_filename
    self.cover_content_type = input_data.content_type.chomp
    self.cover_binary_data = input_data.read
  end

end
