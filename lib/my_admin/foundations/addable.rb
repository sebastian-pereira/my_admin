module MyAdmin
  module Foundations
    
    module Addable
      
      def add(params)
        object self.class.new(params)
        
        object.save
      end
      
    end
  end
end