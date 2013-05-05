module MyAdmin
  module Validators
    module Configs
      class Model < MyValidator
        def validate
          ['edit', 'view', 'delete'].each do |opt|
            unless @conditions['actions'].keys.include?(opt)
              @errors << "Option \"#{opt}\" missing"
            else
              if /(1|0)/.match(@conditions['actions'][opt].to_s) == nil
                @errors << "Option \"#{opt}\" has incorrect format"
              end
            end
          end
        end
      end
    end
  end
end