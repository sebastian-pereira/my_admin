module MyAdmin
  module Records
    module Base
      
      attr_reader :object, :relations, :class_simple_name

      attr_accessor :viewable, :editable, :deletable
      
      def initialize(orm)
        
        @class_simple_name = self.class.name.split('::')[-1].downcase

        if orm
          @object = orm
          @relations = []#init_relations
        end
        
          
      end












      # TODO: Переделать. Это должен быть отднльный класс
      def render
        result = []
        if File.exists?("../../config/table_configs/#{@class_simple_name}.yml")
          yml = YAML.load_file("../../config/table_configs/#{@class_simple_name}.yml")
          
          config = {}
      
          yml.sort_by{|k,v| v["position"]}.each do |v|
            config[v[0]] = v[1]
          end
          
          config.keys.each do |attr|
            value = @object.send(attr)
            
            yml_config = config[attr]
            
            klass = ('MyFields::' + yml_config["type"].capitalize).constantize
            field = klass.new(@class_simple_name, attr, yml_config["label"], value, yml_config["visible"], {})
    
            #if field.visible != '0'
              result.push field
            #end 
          end
        else
          
        end
        
        erb = ERB.new(File.read(File.dirname(__FILE__) + "/../../views/records/templates/edit.html.erb"))
        erb.result(binding).html_safe
      end
      
      
      def view_object(include_relations = false, as_child = false)
        result = []
        if File.exists?("../../config/table_configs/#{@class_simple_name}.yml")
          yml = YAML.load_file("../../config/table_configs/#{@class_simple_name}.yml")
          
          config = {}
      
          yml.sort_by{|k,v| v["position"]}.each do |v|
            config[v[0]] = v[1]
          end
          
          config.keys.each do |attr|
            value = @object.send(attr)
            
            yml_config = config[attr]
            
            field = MyFields::Label.new(@class_simple_name, attr, yml_config["label"], value, yml_config["visible"], {})

            # TODO: Доделать
            #if field.visible != '0'
              result.push field.html(:single)
            #end 
          end
        else
          
        end

        result
        #erb = ERB.new(File.read(File.dirname(__FILE__) + "/../../views/records/templates/index.html.erb"))
        #erb.result(binding).html_safe
      end
      
      private
      
      def init_relations
        relations = YAML.load_file("../../config/models/#{@class_simple_name}.yml")
        if relations['relations']
          relations = relations['relations']
        else
          relations = {}
        end
          
        relation_objects = {}
        
        relations.each_pair do |k, v|
          rels = @object.send(k).all
          relation_objects[k] = []
          rels.each do |r|
            relation_objects[k].push MyAdmin::Records::Faculty.new(r)#@class_simple_name.classify.constantize.new(r)
          end
          
        end
        
        relation_objects
      end
      
      
    end
  end
end