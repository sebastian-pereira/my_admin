module MyAdmin
  module Buttons
    class Save

      def initialize(label)
        super
        @name = :save
      end

      include MyAdmin::Button
    end
  end

end