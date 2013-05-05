module MyAdmin
  module Foundations
    module Actions
      class ActionDecorator < Action

        attr_reader :actions
        def initialize(model, location)
          @actions = []
          super(model, location)
        end

        private #------------------------

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
end