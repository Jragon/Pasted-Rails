class CreatePastes < ActiveRecord::Migration
  def change
    create_table :pastes do |t|
      t.string :name
      t.text :content
      t.string :language_id

      t.timestamps
    end
  end
end
