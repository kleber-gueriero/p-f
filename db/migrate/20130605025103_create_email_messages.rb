class CreateEmailMessages < ActiveRecord::Migration
  def change
    create_table :email_messages do |t|
      t.string :name
      t.string :from
      t.string :subject
      t.string :body

      t.timestamps
    end
  end
end
