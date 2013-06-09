module MyAdmin
  module Records
    module Relations
      class HasOne

        include MyAdmin::Records::Relation

        def doExtract
          @base.send(@name)
        end

      end
    end
  end
end