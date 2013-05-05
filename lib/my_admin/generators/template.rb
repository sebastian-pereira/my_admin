require 'rails/generators'

class AdminTemplateGenerator < Rails::Generators::NamedBase
  source_root File.expand_path("../templates", __FILE__)
  def create_template_file
    
    source_root = File.expand_path("../../../../", __FILE__)
    
    @class_name = file_name
    
    template 'model_template.rb.erb', source_root + "/app/models/my_admin/#{file_name}.rb"
    template 'controller_template.rb.erb', source_root + "/app/controllers/my_admin/#{file_name}_controller.rb"
    
    template 'index_view_template.rb.erb', source_root + "/app/views/my_admin/#{file_name}/index.html.erb"
    template 'index.yml', source_root + "/config/table_configs/#{file_name}.yml"
    #copy_file "class_template.rb", "app/admin_area/templates/classes/#{file_name}/template.rb"
    #create_file "app/admin_area/templates/views/#{file_name}/view.html.haml"
  end
  
  
end