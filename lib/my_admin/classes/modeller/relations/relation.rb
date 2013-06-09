module MyAdmin
  module Modeller
    module Relations
      class Relation
        def initialize(name, values)
          @name = name
          @label = Params::Label.new(name, values['label'])
          @type = Params::Type.new(name, values['type'])
          @visible = Params::Visible.new(name, values['visible'])
          @types = ['has_many', 'has_one', 'belongs_to']
        end

        def render(model_name)
          erb = ERB.new(File.read(File.dirname(__FILE__) + "/../../../views/modeller/relation.html.erb"))
          erb.result(binding).html_safe
        end
      end
    end
  end
end