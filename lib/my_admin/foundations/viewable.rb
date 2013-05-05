module MyAdmin
  module Foundations
    
    module Viewable

      mattr_accessor :model

      def index(args = nil)
        @objects  = []
        objects = @model.all

        objects.each do |obj|
          object = MyAdmin::Records.const_get(@model_name).new(obj)
          # TODO: Переделать. Должно быть без метода доступа.
          get_actions.each do |a|
            object.add_action a
          end
          @objects.push object
        end

        erb = ERB.new(File.read(File.dirname(__FILE__) + "/views/viewable/index.html.erb"))
        erb.result(binding).html_safe

      end
      
    end
  end
end