class Event < ActiveRecord::Base
  has_many :event_photos
  attr_accessible :description, :event_date, :name,
  :cover_file_name, :cover_content_type, :cover_binary_data, :cover_image_file,
  :event_photos
  
  validates_presence_of :event_date, :name, :cover_image_file

  def cover_image_file=(input_data)
    self.cover_file_name = input_data.original_filename
    self.cover_content_type = input_data.content_type.chomp
    self.cover_binary_data = input_data.read
  end
  
  def cover_image_file
    return_data = nil
    unless self.cover_file_name.nil?
      return_data.cover_file_name = self.cover_file_name
      return_data.cover_content_type = self.cover_content_type
      return_data.cover_binary_data = self.cover_binary_data
    end
    return_data
  end

end
