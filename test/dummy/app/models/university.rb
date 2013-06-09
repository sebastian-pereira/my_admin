class University < ActiveRecord::Base
  attr_accessible :name, :abbr, :city_id
  has_many :faculties
  belongs_to :city
  validates :name, :abbr, :city_id, :presence => true
end
