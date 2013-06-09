module MyAdmin
  module Modeller
    module Relations
      module Params
        class Visible
          include Param
          def initialize(relation_name, value = nil)
            super(relation_name, value)
            @name = 'visible'
          end

          def get_field_object
            select = MyFields::Select.new(nil, nil, @method)
            select.set_values({'Да' => '1', 'Нет' => '0'})
            select
          end
        end
      end
    end
  end
end