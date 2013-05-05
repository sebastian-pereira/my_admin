module MyAdmin
  module Foundations
    module Actions
      class Edit < ActionDecorator

        def initialize(model, location)
          super(model, location)

          @actions.push MyAdmin::Foundations::Actions::Save.new(model, 1)
          @actions.push MyAdmin::Foundations::Actions::Back.new(model, 1)
        end

        def do(args)

          if not args[0]['id'] or args[0]['id'].empty?
            # TODO: Исправить создание исключения
            raise ArgumentError, 'Incorrect argument in array ' + args.to_s
          end

          id = args[0]['id']

          object = @model.find(id)
          if object
            @object = MyAdmin::Records.const_get(@model.name).new(object)

            erb = ERB.new(File.read(File.dirname(__FILE__) + "/../views/edit.html.erb"))
            erb.result(binding).html_safe
          else
            raise ActiveRecord::RecordNotFound
          end
        end
      end
    end
  end
end