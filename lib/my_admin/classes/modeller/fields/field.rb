module MyAdmin
  module Modeller
    module Fields
      # Класс поля. Этот класс представляет строку в таблице моделирования
      class Field
        attr_reader :name, :label, :position, :type, :visible, :readonly, :disabled

        def initialize(name, fields_config, v)
          @name = name
          @label = Fields::Params::Label.new('label', fields_config['label'], v['label'])
          @position = Fields::Params::Position.new('position', fields_config['position'], v['position'])
          @type = Fields::Params::Type.new('type', fields_config['type'], v['type'])

          @visible = Fields::Params::Option.new('visible', fields_config['options']['visible'], v['options']['visible'], 'options')
          @readonly = Fields::Params::Option.new('readonly', fields_config['options']['readonly'], v['options']['readonly'], 'options')
          @disabled = Fields::Params::Option.new('disabled', fields_config['options']['disabled'], v['options']['disabled'], 'options')

          @foreign_key = Fields::Params::ForeignKey.new('foreign_key', fields_config['foreign_key'], v['foreign_key'])
          @display_field = Fields::Params::DisplayField.new('display_field', fields_config['display_field'], v['display_field'])
        end

        def render(model_name)
          erb = ERB.new(File.read(File.dirname(__FILE__) + "/../../../views/modeller/fields/edit.html.erb"))
          erb.result(binding).html_safe
        end
      end
    end
  end
end