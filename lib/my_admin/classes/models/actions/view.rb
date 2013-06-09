module MyAdmin
  module Models
    module Actions
      class View < ActionDecorator

        def initialize(model, location)
          super(model, location)
          @actions.push MyAdmin::Models::Actions::Edit.new(model, 0)
          @actions.push MyAdmin::Models::Actions::Delete.new(model, 0)
          @actions.push MyAdmin::Models::Actions::Add.new(model, 1)
        end

        def render(orm)

        end

        def fill_values
          associations = orm.class.reflect_on_all_associations.select{|assoc| assoc.foreign_key.to_s == method.to_s}
          if associations.instance_of? Array and associations.length > 0
            @values = ActiveRecord::Base.const_get(associations[0].klass.name).all.collect{|obj| [obj.send(@display_field), obj.send(obj.class.primary_key)]}
          else
            @values = []
          end
        end

        def do(args)

          @objects  = []
          objects = @model.all

          objects.each do |obj|
            obj = MyAdmin::Records.const_get(@model.name).new(obj, @actions)

            @objects.push obj
          end

          erb = ERB.new(File.read(@view_directory + "/view.html.erb"))
          erb.result(binding).html_safe

        end

      end
    end
  end
end