module MyAdmin
  module Configs
    module Loaders
      class ClassModelLoader

        attr_reader :directory, :path
        attr_accessor :actions, :fields, :relations

        def initialize(model = nil)
          @directory = File.dirname(__FILE__) + '/../../../../../config/table_configs/'
          @containers = []

          if model
            @path = @directory + model.to_s + '.yml'
            unless File.exists?(@path)
              raise 'File not found: "' + model + '"'
            end
            yml = YAML.load_file(@path)
            # TODO: Исправить
            yml['relations'] ||= []
            unless yml['actions'] and yml['fields'] and yml['relations']
              raise 'Incorrect config file format'
            end

            @actions = yml['actions']
            @fields = yml['fields']
            @relations = yml['relations']
            @columns = yml['columns']

            init_containers

          else
            @actions = []
            @fields = []
            @relations = []

            @path = nil
          end
        end


        #def save
        #  hash = {}
        #  @containers.each do |c|
        #    hash.merge! c.compose
        #  end
        #  File.open(@path, 'w') do |f|
        #    YAML::dump(hash, f)
        #  end
        #end
        #
        #
        #private #-----------------
        #
        def init_containers
          #@yml.keys.each do |fraction|
            #TODO: Исключения
            #if defined?(MyAdmin::Configs::Containers.const_get(fraction.capitalize + 'Saver')) != 'constant'
              #raise ClassNotFoundError, 'Class "MyAdmin::Configs::Containers::" '
            #end
            #@savers.push MyAdmin::Configs::Containers.const_get(fraction.capitalize + 'Saver').new(fraction, @yml[fraction])
          #end
        end



      end
    end
  end
end