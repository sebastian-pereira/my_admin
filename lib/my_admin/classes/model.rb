module MyAdmin
  module Model

    include ActionView::Helpers::TagHelper
    include ActionView::Helpers::FormTagHelper
    include ActionView::Helpers::FormHelper
    include ActionView::Helpers::FormOptionsHelper
    #include ::Rails.application.routes.url_helpers

    attr_reader :model_relations, :objects, :actions, :config

    def init_buttons(button_data)
      button_data.each_pair do |name, data|
        @buttons.push MyAdmin::Buttons.const_get(name.capitalize).new(data['label'])
      end
    end

    # Метод создает обрабатываемые объекты для модели, определяет экшены
    def initialize
      @objects = []
      @model_name = class_single_name(self.class, false)
      @actions = []
      @buttons = []

      # конфиг, хранящий данные о модели. содержит три раздела - actions, relations, fields
      @config = MyAdmin::ModelConfigs::Config.new(@model_name.downcase)

      begin
        unless defined?(ActiveRecord::Base.const_get(@model_name)) != 'constant'
          raise ClassNotDefinedException, @model_name
        end

        @model = ActiveRecord::Base.const_get(@model_name )
      rescue NameError => e
        raise ClassNotDefinedError, "Error! Model #{@model_name.capitalize} not found"
      end

      # определяем экшены
      # TODO: переделать на объекты также, как и fields
      @config.actions.keys.each do |action|
        @actions.push MyAdmin::Models::Actions::Action.factory(action, @model)
      end

      init_buttons @config.buttons
    end

    def action_index(args = nil)
      @objects  = []
      objects = @model.all

      objects.each do |obj|
        obj = MyAdmin::Records.const_get(@model.name).new(obj)

        @objects.push obj
      end
      MyAdmin::View.factory('/models/view', @objects)
    end

    def action_edit(args)
      if not args['id'] or args['id'].empty?
        # TODO: Исправить создание исключения
        raise ArgumentError, 'Incorrect argument in array ' + args.to_s
      end

      id = args['id']

      object = @model.find(id)
      if object
        @object = MyAdmin::Records.const_get(@model.name).new(object)

        fields = @object.object_fields

      else
        raise ActiveRecord::RecordNotFound
      end

      MyAdmin::View.factory('/models/edit', {:fields => fields, :model => @model, :object => @object, :buttons => @buttons})
    end

    def action_save(args)
      if not args[@model.name.downcase][:id] or args[@model.name.downcase][:id].empty?
        @object = create(args)
      else
        @object = update(args)
      end

      action_edit args[@model.name.downcase]

    end


    private

    def create(args)
      if not args[@model.name.downcase] or args[@model.name.downcase].empty?
        raise ArgumentError, 'Incorrect argument in array ' + args.to_s
      end

      object = @model.new(args[@model.name.downcase])
      object.save
      unless object.id
        errors = ''
        object.errors.messages.each {|e| errors = errors + e.to_s }
        raise object.errors.messages.to_s
      end
      MyAdmin::Records.const_get(@model.name).new(object)
    end

    def update(args)
      object = @model.find(args[@model.name.downcase][:id])

      if object
        object.update_attributes(args[@model.name.downcase])
        return MyAdmin::Records.const_get(@model.name).new(object)
      else
        raise ActiveRecord::RecordNotFound
      end
    end


    def action_delete(args)
      if not args['id'] or args['id'].empty?
        raise ArgumentError, 'Incorrect argument in array ' + args.to_s
      end

      object = @model.find(args['id'])

      if object
        MyAdmin::Records.const_get(class_single_name(object.class, true, true)).new(object).delete
        action_index
      else
        raise ActiveRecord::RecordNotFound
      end
    end

    def action_do(action, args)
      action_by_name(action).do(args)
    end

    def action_by_name(name)
      @actions.each do |a|
        if a.name == name
          return a
        end
      end
      nil
    end
  end
end
