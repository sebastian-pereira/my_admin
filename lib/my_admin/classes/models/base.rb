module MyAdmin
  module Models
    module Base


      include ActionView::Helpers::TagHelper
      include ActionView::Helpers::FormTagHelper
      include ActionView::Helpers::FormHelper
      include ActionView::Helpers::FormOptionsHelper
      #include ::Rails.application.routes.url_helpers

      attr_reader :model_relations, :objects, :actions, :config
      
      def initialize
        @objects = []
        @model_name = self.class.name.split('::')[-1]
        @actions = []

        @config = MyAdmin::ModelConfigs::Config.new(@model_name.downcase)

        begin
          unless defined?(ActiveRecord::Base.const_get(@model_name)) != 'constant'
            raise ClassNotDefinedException, @model_name
          end

          @model = ActiveRecord::Base.const_get(@model_name )
        rescue NameError => e
          raise ClassNotDefinedError, "Error! Model #{@model_name.capitalize} not found"
        end

        @config.actions.keys.each do |action|
          @actions.push MyAdmin::Foundations::Actions::Action.factory(action, @model)
        end

      end

      def action_do(action, args)
        action_by_name(action).do(args)
      end

      #def index(args)
      #
      #  if action_by_name('view') == nil
      #    raise ActionUnavailableError, 'Action index is not available for this model'
      #  end
      #
      #  @objects  = []
      #  objects = @model.all
      #
      #  objects.each do |obj|
      #    @objects.push MyAdmin::Records.const_get(@model_name).new(obj)
      #  end
      #
      #  erb = ERB.new(File.read(File.dirname(__FILE__) + "/../../views/models/templates/index.html.erb"))
      #  erb.result(binding).html_safe
      #
      #end


      #def edit(args)
      #  if action_by_name('edit') == nil
      #    raise ActionUnavailableError, 'Action is not available for this model'
      #  end
      #
      #  if not args[0]['id'] or args[0]['id'].empty?
      #    # TODO: Исправить создание исключения
      #    raise ArgumentError, 'Incorrect argument in array ' + args.to_s
      #  end
      #
      #  id = args[0]['id']
      #
      #  object = @model.find(id)
      #  if object
      #    @object = MyAdmin::Records.const_get(@model_name).new(object)
      #
      #    erb = ERB.new(File.read(File.dirname(__FILE__) + "/../../views/models/templates/edit.html.erb"))
      #    erb.result(binding).html_safe
      #  else
      #    raise ActiveRecord::RecordNotFound
      #  end
      #end

      #def save(args)
      #  if action_by_name('edit') == nil
      #    raise ActionUnavailableError, 'Action is not available for this model'
      #  end
      #
      #  if not args[0][@model_name.downcase][:id] or args[0][@model_name.downcase][:id].empty?
      #    raise ArgumentError, 'Incorrect argument in array ' + args.to_s
      #  end
      #  #redirect_to :back
      #
      #  object = @model.find(args[0][@model_name.downcase][:id])
      #
      #  if object
      #    object.update_attributes(args[0][@model_name.downcase])
      #    @object = MyAdmin::Records.const_get(@model_name).new(object)
      #    erb = ERB.new(File.read(File.dirname(__FILE__) + "/../../views/models/templates/save.html.erb"))
      #    erb.result(binding).html_safe
      #  else
      #    raise ActiveRecord::RecordNotFound
      #  end
      #end


      #def delete(args = nil)
      #  if action_by_name('delete') == nil
      #    raise ActionUnavailableError, 'Action is not available for this model'
      #  end
      #
      #  if not args[0]['id'] or args[0]['id'].empty?
      #    raise ArgumentError, 'Incorrect argument in array ' + args.to_s
      #  end
      #
      #  object = @model.find(args[0]['id'])
      #
      #  if object
      #    object.delete
      #    erb = ERB.new(File.read(File.dirname(__FILE__) + "/../../views/models/templates/delete.html.erb"))
      #    erb.result(binding).html_safe
      #  else
      #    raise ActiveRecord::RecordNotFound
      #  end
      #end


      private

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
end
