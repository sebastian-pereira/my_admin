module MyAdmin
  module Models
    module Actions
      class Action
        attr_reader :name, :visible, :location

        def self.factory(name, model, location = 0)
          MyAdmin::Models::Actions.const_get(name.capitalize).new(model, location)
        end


        def initialize(model, location)
          @name = class_single_name(self.class)

          @model = model

          @location = location

          @view_directory = File.dirname(__FILE__) + "/../../views/models/actions"
        end

        def render_label(orm = nil)
          erb = ERB.new(File.read(@view_directory + "/labels/#{class_single_name(self.class)}.html.erb"))
          erb.result(binding).html_safe
        end

        def render(orm)

        end


        def do(args)

        end
      end
    end
  end
end