class CreateGeneralLogs < ActiveRecord::Migration
  def change
    create_table :general_logs do |t|
      t.integer :log_type
      t.string :header
      t.text :body

      t.timestamps
    end
  end
end
