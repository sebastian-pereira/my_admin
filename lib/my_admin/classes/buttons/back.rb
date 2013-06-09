module MyAdmin
  module Buttons
    class Back

      def initialize(label)
        super
        @name = :back
      end

      include MyAdmin::Button
    end
  end

end