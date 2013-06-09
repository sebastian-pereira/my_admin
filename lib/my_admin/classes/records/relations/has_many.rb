module MyAdmin
  module Records
    module Relations
      class HasMany
        include MyAdmin::Records::Relation

        def doExtract
          @base.send(@name).all
        end

      end
    end
  end
end