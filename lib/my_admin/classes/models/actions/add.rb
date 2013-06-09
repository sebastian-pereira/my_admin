module MyAdmin
  module Models
    module Actions
      class Add < ActionDecorator

        def initialize(model, location)
          @visible = true
          super(model, location)

          @actions.push MyAdmin::Models::Actions::Save.new(model, 1)
        end

        def do(args)

          object = @model.new

          @object = MyAdmin::Records.const_get(@model.name).new(object)

          fields = @object.object_fields
          erb = ERB.new(File.read(@view_directory + "/edit.html.erb"))
          erb.result(binding).html_safe
        end

      end
    end
  end
end