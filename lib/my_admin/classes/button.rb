module MyAdmin
  module Button
    def initialize(label)
      @label = label
    end

    def render
      View::factory('buttons/' + @name.to_s)
    end
  end
end