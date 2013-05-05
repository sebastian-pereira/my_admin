module MyAdmin
  module Foundations
    module Actions
      class View < ActionDecorator

        def initialize(model, location)
          super(model, location)
          @actions.push MyAdmin::Foundations::Actions::Edit.new(model, 0)
          @actions.push MyAdmin::Foundations::Actions::Delete.new(model, 0)
          @actions.push MyAdmin::Foundations::Actions::Add.new(model, 1)
        end

        def render(orm)

        end

        def do(args)

          @objects  = []
          objects = @model.all

          objects.each do |obj|
            @objects.push MyAdmin::Records.const_get(@model.name).new(obj)
          end

          erb = ERB.new(File.read(File.dirname(__FILE__) + "/../views/index.html.erb"))
          erb.result(binding).html_safe

        end

      end
    end
  end
end