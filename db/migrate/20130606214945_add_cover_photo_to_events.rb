class AddCoverPhotoToEvents < ActiveRecord::Migration
  def up
    change_table :events do |t|
      t.string :cover_file_name
      t.string :cover_content_type
      t.binary :cover_binary_data
    end
  end
  
  def down
    change_table :events do |t|
      t.remove :cover_file_name
      t.remove :cover_content_type
      t.remove :cover_binary_data
    end
  end
  
end
