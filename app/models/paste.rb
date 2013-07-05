class Paste < ActiveRecord::Base
  attr_accessible :content, :language_id, :name
  
  belongs_to :language
  belongs_to :user

  validates :content, :name, presence: true
end