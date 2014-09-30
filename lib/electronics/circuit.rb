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

    def nodes
      terminals.map(&:node).compact.uniq
    end

    private

    def terminals
      @components.map{|c| c.terminals.values }.flatten.uniq
    end
  end
end
