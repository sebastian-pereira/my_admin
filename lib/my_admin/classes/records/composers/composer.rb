module MyAdmin
  module Records
    module Composers
      module Composer

        attr_reader :loader, :objects

        def initialize(orm)
          @orm = orm
          class_name = class_single_name(@orm.class).downcase

          @objects = []

          @loader = MyAdmin::Configs::Loaders::ClassModelLoader.new(class_name)
        end

      end
    end
  end
end