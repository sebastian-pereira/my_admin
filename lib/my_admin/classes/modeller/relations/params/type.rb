module MyAdmin
  module Modeller
    module Relations
      module Params
        class Type
          include Param
          def initialize(relation_name, value = nil)
            super(relation_name, value)
            @name = 'type'
            @types = {'has_many' => 'has_any', 'has_one' => 'has_one', 'belongs_to' => 'belongs_to'}
          end

          def get_field_object
            select = MyFields::Select.new(nil, nil, @method)
            select.set_values(@types)
            select
          end
        end
      end
    end
  end
end