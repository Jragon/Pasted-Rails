class Paste < ActiveRecord::Base
  attr_accessible :content, :language_id, :name, :user_id
  
  belongs_to :language
  belongs_to :user

  validates :content, :name, presence: true
end