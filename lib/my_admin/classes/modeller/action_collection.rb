module MyAdmin
  module Modeller
    # Класс коллекции экшенов
    class ActionCollection
      def initialize(actions)
        @view = Actions::Action.new('view', actions['view'])
        @add = Actions::Action.new('add', actions['add'])
        @edit = Actions::Action.new('edit', actions['edit'])
        @save = Actions::Action.new('edit', actions['save'])
        @delete = Actions::Action.new('delete', actions['delete'])
      end

      def render(model_name)
        erb = ERB.new(File.read(File.dirname(__FILE__) + "/../../views/modeller/actions.html.erb"))
        erb.result(binding).html_safe
      end
    end
  end
end