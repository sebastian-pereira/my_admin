module MyAdmin
  module Models
    module Actions
      class Delete < ActionDecorator

        def do(args = nil)

          if not args[0]['id'] or args[0]['id'].empty?
            raise ArgumentError, 'Incorrect argument in array ' + args.to_s
          end

          object = @model.find(args[0]['id'])

          if object
            object.delete
            erb = ERB.new(File.read(@view_directory + "/#{class_single_name(self.class)}.html.erb"))
            erb.result(binding).html_safe
          else
            raise ActiveRecord::RecordNotFound
          end
        end

      end
    end
  end
end