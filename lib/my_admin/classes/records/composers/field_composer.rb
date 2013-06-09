module MyAdmin
  module Records
    module Composers
      class FieldComposer

        include Composer

        def init_objects
          @loader.fields.each_pair do |name, attrs|
            # TODO: Exceptions
            @objects.push MyAdmin::Configs::Field.new(name, attrs, @orm)
          end
        end

      end
    end
  end
end