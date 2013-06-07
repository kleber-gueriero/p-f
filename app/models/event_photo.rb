class EventPhoto < ActiveRecord::Base
  belongs_to :event
  attr_accessible :before_binary_data, :before_content_type, :before_file_name, :before_image_file, :event_id, :is_cover,
  :after_binary_data, :after_content_type, :after_file_name, :after_image_file
  validates_presence_of :before_image_file, :after_image_file
  
  def before_image_file=(input_data)
    self.before_file_name = input_data.original_filename
    self.before_content_type = input_data.content_type.chomp
    self.before_binary_data = input_data.read
  end
  
  def before_image_file
    return_data = nil
    unless self.before_file_name.nil?
      return_data.before_file_name = self.before_file_name
      return_data.before_content_type = self.before_content_type
      return_data.before_binary_data = self.before_binary_data
    end
    return_data
  end
  
  def after_image_file=(input_data)
    self.after_file_name = input_data.original_filename
    self.after_content_type = input_data.content_type.chomp
    self.after_binary_data = input_data.read
  end
  
  def after_image_file
    return_data = nil
    unless self.after_file_name.nil?
      return_data.after_file_name = self.after_file_name
      return_data.after_content_type = self.after_content_type
      return_data.after_binary_data = self.after_binary_data
    end
    return_data
  end
  
end
