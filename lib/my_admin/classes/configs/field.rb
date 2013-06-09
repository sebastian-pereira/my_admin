module MyAdmin
  module Configs
    class Field
      attr_reader :name, :label, :type, :value, :options, :foreign_key, :display_field

      def initialize(name, data, orm)
        @name, @orm, @label, @type = name, orm, data['label'], data['type']
        @foreign_key = convert_to_boolean(data['foreign_key'])
        @display_field = data['display_field']
        # TOD: Реализовать в классах полей
        @options = {}
        data['options'].each_pair do |k, v|
          @options[k] = convert_to_boolean(v)
        end
      end

      # Вьюха поля как с учетом типа
      def get_render_object
        return MyFields.const_get(@type.capitalize).new(@orm, @label, @name, @options, @foreign_key, @display_field)
        if defined?(MyFields.const_get(@type.capitalize)) == 'constant'
          #MyFields.const_get(@type.capitalize).new(class_single_name(@orm.class), name, @label, @orm.send(:name), @options)
        else
          raise ClassNotDefinedError, @type.capitalize
        end
      end

      # Вьюха поля только для чтения
      def view_render_object
        return MyFields::Label.new(@orm, @label, @name, @options, @foreign_key, @display_field)
      end

      private #-----------------

      def convert_to_boolean(var)
        case var
          when '0'
            return false
          when '1'
            return true
          else
            raise 'Incorrect config boolean value: ' + var.to_s
        end
      end
    end
  end
end