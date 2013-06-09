module MyAdmin
  module Modeller
    module Fields
      module Params
        class DisplayField < Param

          def field_object(model_name)
            values = ActiveRecord::Base.const_get(model_name.classify).attribute_names
            config = {}
            values.each do |v|
              config[v] = v
            end
            select = MyFields::Select.new(nil, nil, set_method(model_name))
            select.set_values(config.invert)
            select
          end
        end
      end
    end
  end
end