class Faculty < ActiveRecord::Base
  attr_accessible :name
  belongs_to :university
end
