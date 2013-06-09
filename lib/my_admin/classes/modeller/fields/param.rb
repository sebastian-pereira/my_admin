module MyAdmin
  module Modeller
    module Fields
      # Класс атрибута. Этот класс представляет объекты полей в таблице моделирования
      # Один атрибут - одно поле в строке
      class Param

        attr_reader :name, :label, :type_name, :type, :options, :value
        attr_accessor :scope, :field

        # name - это имя поля из конфига fields.
        # data - это данные из конфига fields.
        # data = {label:'label', type: 'type', options: {values: 'yes_no'}}
        def initialize(name, data, value = nil, scope = '')
          if data['label'] == nil or data['type'] == nil
            raise 'Field config error.'
          end
          @name, @scope, @value = name, scope, value
          @label, @type_name = data['label'], data['type']
          # options не обязательны
          @options = data['options'] ? data['options'] : {}
        end

        # Вывод поля
        def render(model_name, options = {})
          field = field_object(model_name)
          field.value = @value
          field.options['class'] = class_single_name(self.class, false, false).tableize.singularize
          options.each_pair do |option, value|
            field.options[option] = value
          end

          @js = js.to_s
          @html = field.html
          erb = ERB.new(File.read(File.dirname(__FILE__) + "/../../../views/modeller/fields/param.html.erb"))
          erb.result(binding).html_safe
        end
        # Метод получения объекта из MyFields
        def field_object(model_name)
          MyFields::Label.new(nil, nil, set_method(model_name))
        end

        def set_method(model_name)
          method = model_name + '[fields]'
          if @scope != ''
            method += '[' + @scope + ']'
          end
          method += '[' + @name + ']'
        end

        def js

        end

      end
    end
  end
end