module MyAdmin
  module Foundations
    module Actions
      class Save < ActionDecorator

        def do(args)

          if not args[0][@model.name.downcase][:id] or args[0][@model.name.downcase][:id].empty?
            @object = create(args)
          else
            @object = update(args)
          end
          erb = ERB.new(File.read(File.dirname(__FILE__) + "/../views/save.html.erb"))
          erb.result(binding).html_safe
          #redirect_to :back


        end

        private

        def create(args)
          if not args[0][@model.name.downcase] or args[0][@model.name.downcase].empty?
            raise ArgumentError, 'Incorrect argument in array ' + args.to_s
          end

          object = @model.new(args[0][@model.name.downcase])
          object.save
          MyAdmin::Records.const_get(@model.name).new(object)
        end

        def update(args)
          object = @model.find(args[0][@model.name.downcase][:id])

          if object
            object.update_attributes(args[0][@model.name.downcase])
            return MyAdmin::Records.const_get(@model.name).new(object)
          else
            raise ActiveRecord::RecordNotFound
          end
        end

      end
    end
  end
end