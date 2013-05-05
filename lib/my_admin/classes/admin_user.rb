class MyAdmin::AdminUser < ActiveRecord::Base
  attr_accessible :name, :surname, :email, :password, :active, :avatar, :admin_user_role, :trash
end