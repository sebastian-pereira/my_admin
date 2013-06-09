module MyAdmin
  module ModelConfigs
    class Config

      attr_reader :relations, :errors, :actions, :buttons

      def initialize(model)
        @errors = []
        @actions = {}
        @columns = []
        @buttons = []

        conditions = YAML.load_file("../../config/table_configs/#{model}.yml")

        @validator = MyAdmin::Validators::Configs::Model.new(conditions)
        @validator.validate

        if @validator.errors.length > 0
          raise MyValidationError, @validator.errors.to_s
        end

        conditions['actions'].each_pair do |action, value|
          @actions[action] = value #if @actions[action] == '1'
        end

        if conditions.keys.include?('relations')
          @relations = conditions['relations']
        end

        if conditions.keys.include?('columns')
          @columns = conditions['columns']
        end

        if conditions.keys.include?('buttons')
          @buttons = conditions['buttons']
        end
      end
    end

  end
end