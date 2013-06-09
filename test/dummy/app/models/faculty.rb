class Faculty < ActiveRecord::Base
  attr_accessible :name, :university_id
  belongs_to :university

  validates :name, :presence => true
end
