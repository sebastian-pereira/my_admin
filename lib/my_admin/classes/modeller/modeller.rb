module MyAdmin
  module Modeller
    class Modeller
      # Класс, осуществляющий отображение и редактирование модели данных
      def initialize(model_name)
        @view_directory = File.dirname(__FILE__) + "/../../views/modeller"
        model_config = MyAdmin::Configs::Loaders::ClassModelLoader.new(model_name)
        # Подгружаем поля
        @fields     = FieldCollection.new(model_config.fields).render(model_name)
        # Экшены
        @actions    = ActionCollection.new(model_config.actions).render(model_name)
        # Отношения
        @relations  = RelationCollection.new(model_config.relations).render(model_name)
      end

      def edit
        erb = ERB.new(File.read(@view_directory + "/edit.html.erb"))
        erb.result(binding).html_safe
      end

      def save
        #Check loaded data
      end

    end
  end
end