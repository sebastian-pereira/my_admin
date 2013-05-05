module MyAdmin
  module Models
    class University
      @@actions = []

      include MyAdmin::Models::Base

      def self.add_action(action)
        @@actions.push action
      end
      #
      ## TODO: Убрать в Records
      #include MyAdmin::Foundations::Editable
      #include MyAdmin::Foundations::Deletable
      #include MyAdmin::Foundations::Viewable
      #
      def get_actions
        @@actions
      end



    end
  end
end