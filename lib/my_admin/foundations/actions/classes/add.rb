module MyAdmin
  module Foundations
    module Actions
      class Add < ActionDecorator

        def initialize(model, location)
          @visible = true
          super(model, location)

          @actions.push MyAdmin::Foundations::Actions::Save.new(model, 1)
        end

        def do(args)

          object = @model.new

          @object = MyAdmin::Records.const_get(@model.name).new(object)
          erb = ERB.new(File.read(File.dirname(__FILE__) + "/../views/edit.html.erb"))
          erb.result(binding).html_safe
        end

      end
    end
  end
end