module MyAdmin
  module Modeller
    # Класс коллекции полей
    class FieldCollection
      def initialize(model_fields)
        fields_config = YAML.load_file("../../config/fields.yml")
        @fields = {}
        model_fields.each_pair do |k, v|
          @fields[k] = Fields::Field.new(k, fields_config, v)
        end
      end

      def render(model_name)
        erb = ERB.new(File.read(File.dirname(__FILE__) + "/../../views/modeller/fields.html.erb"))
        erb.result(binding).html_safe
      end
    end
  end
end