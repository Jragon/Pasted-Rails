class Paste < ActiveRecord::Base
  attr_accessible :content, :language_id, :name
  belongs_to :language
  validates :content, :name, presence: true
end