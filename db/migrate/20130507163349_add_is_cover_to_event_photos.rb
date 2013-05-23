class AddIsCoverToEventPhotos < ActiveRecord::Migration
  def change
    add_column :event_photos, :is_cover, :boolean
  end
end
