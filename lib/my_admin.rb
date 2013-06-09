module MyAdmin

  mattr_reader :lib_root_path
  @@lib_root_path = File.dirname(__FILE__) + '/my_admin/'

  require 'active_support'
  require 'my_admin/classes/view'
  require 'my_admin/foundation'
  require 'my_admin/adapter'
  require 'my_admin/classes/button'
  require 'my_admin/classes/buttons/back'
  require 'my_admin/classes/buttons/save'

  require 'my_admin/classes/configs/loaders/model_loader'
  require 'my_admin/classes/records/composers/composer'
  require 'my_admin/classes/records/composers/field_composer'

  require 'my_admin/classes/configs/field'


  require 'my_admin/exceptions/class_not_defined'
  require 'my_admin/exceptions/action_unavailable'
  require 'my_admin/exceptions/my_validation'
  require 'my_admin/classes/validators/configs/base'
  require 'my_admin/classes/validators/configs/model'
  require 'my_admin/classes/configs/config'


  require 'my_admin/generators/template'
  require 'my_admin/engine'
  require 'my_admin/helpers/columnizer'
  require 'my_admin/classes/model'
  require 'my_admin/classes/models/university'
  require 'my_admin/classes/models/faculty'
  require 'my_admin/classes/models/album'
  require 'my_admin/classes/fields/model'
  require 'my_admin/classes/fields/models/attribute'
  require 'my_admin/classes/fields/models/field'


  require 'my_admin/classes/records/relation'
  require 'my_admin/classes/records/relations/belongs_to'
  require 'my_admin/classes/records/relations/has_many'
  require 'my_admin/classes/records/relations/has_one'
  require 'my_admin/classes/record'
  require 'my_admin/classes/records/university'
  require 'my_admin/classes/records/faculty'
  require 'my_admin/classes/records/album'
  require 'my_admin/classes/records/user'



  require 'my_admin/classes/modeller/fields/param'
  require 'my_admin/classes/modeller/fields/params/label'
  require 'my_admin/classes/modeller/fields/params/type'
  require 'my_admin/classes/modeller/fields/params/option'
  require 'my_admin/classes/modeller/fields/params/foreign_key'
  require 'my_admin/classes/modeller/fields/params/display_field'
  require 'my_admin/classes/modeller/fields/params/position'


  require 'my_admin/classes/modeller/modeller'
  require 'my_admin/classes/modeller/fields/field'

  require 'my_admin/classes/modeller/relations/param'
  require 'my_admin/classes/modeller/relations/params/label'
  require 'my_admin/classes/modeller/relations/params/type'
  require 'my_admin/classes/modeller/relations/params/visible'
  require 'my_admin/classes/modeller/relations/relation'
  require 'my_admin/classes/modeller/relation_collection'
  require 'my_admin/classes/modeller/field_collection'




  
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