class ChangeLanguageIdToIntegerPastes < ActiveRecord::Migration
  def self.up
   change_column :pastes, :language_id, :integer
  end

  def self.down
   change_column :pastes, :language_id, :string
  end
end
