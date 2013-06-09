module MyAdmin
  module Modeller
    module Relations
      module Params
        module Param
          def initialize(relation_name, value = nil)
            @name = nil
            @value = value
            @relation_name = relation_name
          end

          def render(model_name)
            @method = model_name + '[relations][' + @relation_name + '][' + @name + ']'
            obj = get_field_object
            obj.value = @value
            obj.html
          end

          def get_field_object
            MyFields::Label.new(nil, nil, @method)
          end
        end
      end
    end
  end
end