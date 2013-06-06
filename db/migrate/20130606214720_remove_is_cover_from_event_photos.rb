class RemoveIsCoverFromEventPhotos < ActiveRecord::Migration
  def change
    change_table :event_photos do |t|
      t.remove :is_cover
    end
  end
end
