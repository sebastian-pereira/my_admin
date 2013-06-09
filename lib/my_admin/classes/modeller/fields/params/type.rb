module MyAdmin
  module Modeller
    module Fields
      module Params
        # Класс атрибута типа.
        class Type < Param
          def field_object(model_name)
            config = YAML.load_file(File.dirname(__FILE__) + '/../../../../../../config/field_values/' + @options['values'].to_s + '.yml')
            select = MyFields::Select.new(nil, nil, set_method(model_name))
            select.set_values(config.invert)
            select
          end
        end
      end
    end
  end
end