module MyAdmin
  module Records
    module Relation

      attr_reader :name, :visible, :objects, :view_directory

      def initialize(name, label, type, visible, orm)
        @label = label
        @name = name
        @base = orm
        @type = type
        @visible = visible
        @data = extract

        @view_directory = File.dirname(__FILE__) + "/../../views/records/relations"
      end

      def extract
        if @visible
          return doExtract
        end
      end

      def doExtract
        raise NotImplementedError
      end

      def render(actions)
        erb = ERB.new(File.read(@view_directory + "/#{@type}.html.erb"))
        erb.result(binding).html_safe
      end
      
    end
  end
end