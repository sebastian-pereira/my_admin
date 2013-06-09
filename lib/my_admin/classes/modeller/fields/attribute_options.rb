module MyAdmin
  module Modeller
    module Fields
      # Класс, представляющий кортеж options из конфига полей для конкретной модели
      class AttributeOptions
        attr_reader :visible, :readonly, :disabled

        def initialize(visible, readonly, disabled)
          @visible, @readonly, @disabled = visible, readonly, disabled
        end
      end
    end
  end
end