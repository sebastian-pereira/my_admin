module MyAdmin
  module Records
    module Relations
      class BelongsTo
        include MyAdmin::Records::Relation

        def doExtract
          @base.send(@name)
        end
      end
    end
  end
end