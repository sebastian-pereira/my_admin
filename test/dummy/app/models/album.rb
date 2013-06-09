class Album < ActiveRecord::Base
  attr_accessible :name, :alias, :announce, :description, :user_id
  validates :name, :alias, :user_id, :presence => true
end
