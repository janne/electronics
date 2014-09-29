module Electronics
  class Circuit
    attr_reader :components

    def initialize
      @components = []
    end

    def add(component)
      unless component.is_a? Component
        raise Electronics::InvalidComponent, "'#{component}' is not a component"
      end
      @components << component
      component
    end
  end
end
