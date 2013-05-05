module MyAdmin
  module Foundations
    module Actions
      class Action
        attr_reader :name, :visible, :location

        def self.factory(name, model, location = 0)
          MyAdmin::Foundations::Actions.const_get(name.capitalize).new(model, location)
        end


        # TODO: Здесь все надо переделать. location должно передаваться через полиморфизм.
        def initialize(model, location)

          @name = self.class.name.split('::')[-1].downcase

          @model = model

          @location = location



        end

        def render_label(orm = nil)
          erb = ERB.new(File.read(File.dirname(__FILE__) + "/../views/labels/#{self.class.name.split('::')[-1].downcase}.html.erb"))
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