module MyAdmin
  module Models
    class University
      @@actions = []

      include MyAdmin::Model

      def self.add_action(action)
        @@actions.push action
      end

      def get_actions
        @@actions
      end



    end
  end
end