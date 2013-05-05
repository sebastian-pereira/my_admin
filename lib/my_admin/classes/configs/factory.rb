module MyAdmin
  module ModelConfigs
    class Factory
      def self.factory(name, file = nil)
        unless defined?(MyAdmin::Configs.const_get(name)) == 'constant'
          raise ClassNotDefinedError, 'Class ' + name.capitalize + ' not found'
        end

        MyAdmin::Configs.const_get(name).new(file)
      end
    end
  end
end