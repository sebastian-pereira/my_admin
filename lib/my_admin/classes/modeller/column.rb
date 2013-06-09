module MyAdmin
  module Modeller
    # Класс поля. Этот класс представляет строку в таблице моделирования
    class Column
      attr_reader :name, :label, :position, :visible, :in_relations, :fields

      def initialize(name, label, position, fields, visible = true, in_relations = true)
        @name = name
        @label = label
        @position = position
        @visible = visible

        @in_relations = in_relations
        @fields = fields

      end

      def render(model_name)
        #erb = ERB.new(File.read(File.dirname(__FILE__) + "/../../../views/modeller/fields/edit.html.erb"))
        #erb.result(binding).html_safe
      end
    end
  end
end