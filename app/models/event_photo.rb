class EventPhoto < ActiveRecord::Base
  belongs_to :event
  attr_accessible :binary_data, :content_type, :file_name, :image_file, :event_id, :is_cover
  
  def image_file=(input_data)
    self.file_name = input_data.original_filename
    self.content_type = input_data.content_type.chomp
    self.binary_data = input_data.read
  end
  
end
