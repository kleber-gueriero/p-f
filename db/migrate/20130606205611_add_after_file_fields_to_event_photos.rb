class AddAfterFileFieldsToEventPhotos < ActiveRecord::Migration
  def change
    
    change_table :event_photos do |t|
      t.string :after_file_name
      t.string :after_content_type
      t.binary :after_binary_data
    end
    
  end
end
