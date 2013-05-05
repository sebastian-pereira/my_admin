# encoding: utf-8
module MyAdmin
  module Fields
    module Models
      class Attribute
    
        attr_reader :name, :value, :errors
        
        def initialize(name, value)
          @name = name
          
          @value = value
          @errors = []
          
          #validate
        end
        
        def to_hash
          {@name => @value}
        end
        
        private
        def validate
          if attr.value =~ /[A-Za-z]+/i
              @errors[:names] << "Incorrect string format : ".attr.name
            end
        end
      end
    end
  end
end