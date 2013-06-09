module MyAdmin
  module Modeller
    module Actions
      class Action
        def initialize(name, value = nil)
          @name, @value = name, value
        end

        def render(model_name)
          select = MyFields::Select.new(nil, nil, model_name + '[actions][' + @name + ']')
          select.set_values({'Да' => '1', 'Нет' => '0'})
          select.value = @value
          select.html
        end
      end
    end
  end
end