module MyAdmin
  module Modeller
    module Relations
      module Params
        class Label
          include Param
          def initialize(relation_name, value = nil)
            super(relation_name, value)
            @name = 'label'
          end

          def get_field_object
            MyFields::Text.new(nil, nil, @method)
          end
        end
      end
    end
  end
end