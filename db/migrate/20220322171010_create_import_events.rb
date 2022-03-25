class CreateImportEvents < ActiveRecord::Migration[6.0]
  def change
    create_table :import_events do |t|
      t.string :import_type
      t.string :status
      t.string :file_name
      t.text :message

      t.timestamps
    end
  end
end
