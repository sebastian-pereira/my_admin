module MyAdmin
  module Modeller
    # Класс коллеции отношений
    class RelationCollection
      def initialize(relations)
        @relations = []
        relations.each_pair do |name, values|
          @relations.push Relations::Relation.new(name, values)
        end
        @types = ['has_many', 'has_one', 'belongs_to']
      end

      def render(model_name)
        erb = ERB.new(File.read(File.dirname(__FILE__) + "/../../views/modeller/relations.html.erb"))
        erb.result(binding).html_safe
      end
    end
  end
end