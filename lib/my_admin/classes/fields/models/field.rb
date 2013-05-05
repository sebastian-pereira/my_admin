# encoding: utf-8
module MyAdmin
  module Fields
    module Models
      class Field
        
        #include ActiveModel::Validations
        #validate :validate_model, :on => :collect_attributes
    
        attr_reader :name, :attributes, :errors
        
        def initialize(name)
          @name = name
          @attributes = []
          @errors = []
        end
        
        def add_attr(attribute)
          @attributes.push attribute
        end
        
        def collect_attributes(data)
          #if data.instance_of? Hash
            data.each_pair do |name, value|
              @attributes.push Attribute.new(name, value)
            end
            validate_model
          #end
        end
        
        def collect
          hs = {}
          @attributes.each do |a|
            hs[a.name] = a.value
          end
          hs = {@name => hs}
        end
        
        private
        def validate_model
          @attributes.each do |attr|
            unless attr.value =~ /[A-Za-z0-9]+/i
              @errors << "Incorrect string format : " + attr.name
            end
          end
        end
        
      end
    end
  end
end