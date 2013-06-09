module MyAdmin
  module Modeller
    module Fields
      module Params
        # Класс атрибута типа.
        class Position < Param
          def field_object(model_name)
            MyFields::Text.new(nil, nil, set_method(model_name))
          end
        end
      end
    end
  end
end