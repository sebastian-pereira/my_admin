module MyAdmin
  module Configs
    module Containers
      class BaseContainer

        def initialize(key, data)
          @key = key
          @data = data
        end

        def compose
          {@key => @data}
        end

      end
    end
  end
end