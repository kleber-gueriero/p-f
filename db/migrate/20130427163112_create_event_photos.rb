class CreateEventPhotos < ActiveRecord::Migration
  def change
    create_table :event_photos do |t|
      t.references :event
      t.string :file_name
      t.string :content_type
      t.binary :binary_data

      t.timestamps
    end
    add_index :event_photos, :event_id
  end
end
