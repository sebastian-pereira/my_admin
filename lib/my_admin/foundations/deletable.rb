module MyAdmin
  module Foundations
    
    module Deletable

      mattr_accessor :model


      
      def delete(args = nil)
        if not args[0][@model_name.downcase][:id] or args[0][@model_name.downcase][:id].empty?
          raise ArgumentError, 'Incorrect argument in array ' + args.to_s
        end

        object = @model.find(args[0]['id'])

        if object
          object.delete
          erb = ERB.new(File.read(File.dirname(__FILE__) + "/views/deletable/delete.html.erb"))
          erb.result(binding).html_safe
        else
          raise ActiveRecord::RecordNotFound
        end
      end

      def self.included(klass)
        klass.add_action MyAdmin::Foundations::Actions::Delete.new
      end
      
    end
  end
end