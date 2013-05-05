class MyAdmin::AdminUserRole < ActiveRecord::Base
  attr_accessible :name, :alias
end