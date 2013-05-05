class MyAdmin::Material < ActiveRecord::Base
  #attr_accessible :name, :surname, :email, :password, :active, :avatar, :admin_user_role, :trash
  attr_accessible :active, :trash
end