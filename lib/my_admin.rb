

#require 'my_admin/models/attribute'
#require 'my_admin/models/field'

module MyAdmin
  require 'active_support'
  require 'my_admin/foundation'
  require 'my_admin/adapter'


  require 'my_admin/exceptions/class_not_defined'
  require 'my_admin/exceptions/action_unavailable'
  require 'my_admin/exceptions/my_validation'
  require 'my_admin/classes/validators/configs/base'
  require 'my_admin/classes/validators/configs/model'
  require 'my_admin/classes/configs/config'


  require 'my_admin/foundations/actions/classes/action'
  require 'my_admin/foundations/actions/classes/action_decorator'
  require 'my_admin/foundations/actions/classes/edit'
  require 'my_admin/foundations/actions/classes/index'
  require 'my_admin/foundations/actions/classes/delete'
  require 'my_admin/foundations/actions/classes/save'
  require 'my_admin/foundations/actions/classes/back'
  require 'my_admin/foundations/actions/classes/add'
  require 'my_admin/foundations/addable'
  require 'my_admin/foundations/viewable'
  require 'my_admin/foundations/editable'
  require 'my_admin/foundations/deletable'

  require 'test/test_class'
  require 'my_admin/generators/template'
  require 'my_admin/engine'
  require 'my_admin/helpers/columnizer'
  require 'my_admin/classes/models/base'
#require 'my_admin/classes/models/user'
  require 'my_admin/classes/models/university'
  require 'my_admin/classes/models/faculty'
#require 'my_admin/classes/models/user_role'
  require 'my_admin/classes/fields/model'
  require 'my_admin/classes/fields/models/attribute'
  require 'my_admin/classes/fields/models/field'


  require 'my_admin/classes/records/base'
  require 'my_admin/classes/records/university'
  require 'my_admin/classes/records/faculty'
  require 'my_admin/classes/records/user'
  
  mattr_accessor :app_root

  # Yield self on setup for nice configs blocks
  def self.setup
    yield self
  end

  class Engine < Rails::Engine#:nodoc:
    initializer "initialize" do |app|
      ActionController::Base.send :include, MyAdmin
    end
  end

end

ActionController::Base.send(:include, MyAdmin::Adapter::Implementation)