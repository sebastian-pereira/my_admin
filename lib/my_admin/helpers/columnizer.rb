def colzer(object)
  result = []
  
  file_name = object.class.name.downcase
  
  attrs = object.attributes.keys
  
  if File.exists?("../../config/table_configs/#{file_name}.yml")
      yml = YAML.load_file("../../config/table_configs/#{file_name}.yml")
      
      config = {}
      
      yml.sort_by{|k,v| v["position"]}.each do |v|
        config[v[0]] = v[1]
      end
      
      config.keys.each do |attr|
        value = object.send(attr)
        
        yml_config = config[attr]
        
        klass = ('MyFields::' + yml_config["type"].capitalize).constantize
        field = klass.new(file_name, attr, yml_config["label"], value, yml_config["visible"], {})

        if field.visible != '0'
          result.push field
        end 
      end
  end
  result
end