class University < ActiveRecord::Base
  attr_accessible :name, :abbr
  has_many :faculties
end
