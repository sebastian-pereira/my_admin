module MyAdmin
  module Validators
    module Configs
      class MyValidator

        attr_reader :errors

        def initialize(conditions)
          @errors = []
          @conditions = conditions
        end

        def validate
          rescue 'Class should be abstract'
        end

      end
    end
  end
end