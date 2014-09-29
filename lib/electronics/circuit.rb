module Electronics
  class Circuit
    attr_reader :components

    def initialize
      @components = []
    end

    def add(component)
      raise InvalidComponent, "'#{component}' is not a component" unless component.is_a? Component
      @components << component
    end
  end
end
