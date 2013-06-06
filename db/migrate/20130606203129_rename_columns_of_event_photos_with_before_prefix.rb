class RenameColumnsOfEventPhotosWithBeforePrefix < ActiveRecord::Migration
  def change
      rename_column :event_photos, :file_name, :before_file_name
      rename_column :event_photos, :content_type, :before_content_type
      rename_column :event_photos, :binary_data, :before_binary_data
  end

end
