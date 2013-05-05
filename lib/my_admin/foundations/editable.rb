module MyAdmin
  module Foundations

    module Editable

      def edit(args)
        if not args[0]['id'] or args[0]['id'].empty?
          # TODO: Исправить создание исключения
          raise ArgumentError, 'Incorrect argument in array ' + args.to_s
        end

        id = args[0]['id']

        object = @model.find(id)
        if object
          @object = MyAdmin::Records.const_get(@model_name).new(object)

          erb = ERB.new(File.read(File.dirname(__FILE__) + "/views/editable/edit.html.erb"))
          erb.result(binding).html_safe
        else
          raise ActiveRecord::RecordNotFound
        end
      end

      def save(args)
        if not args[0][@model_name.downcase][:id] or args[0][@model_name.downcase][:id].empty?
          raise ArgumentError, 'Incorrect argument in array ' + args.to_s
        end
        #redirect_to :back

        object = @model.find(args[0][@model_name.downcase][:id])

        if object
          object.update_attributes(args[0][@model_name.downcase])
          @object = MyAdmin::Records.const_get(@model_name).new(object)
          erb = ERB.new(File.read(File.dirname(__FILE__) + "/views/editable/save.html.erb"))
          erb.result(binding).html_safe
        else
          raise ActiveRecord::RecordNotFound
        end
      end

      def self.included(klass)
        klass.add_action MyAdmin::Foundations::Actions::Edit.new
      end

    end
  end
end