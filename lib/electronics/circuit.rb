module Electronics
  class Circuit
    attr_reader :components

    def initialize
      @components = []
    end

    def add(component)
      @components << component
    end
  end
end
