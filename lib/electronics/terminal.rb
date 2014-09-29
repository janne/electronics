module Electronics
  class Terminal
    attr_reader :name, :component
    def initialize(component, opts = {})
      @component = component
      @name = opts.fetch(:name, "")
    end

    def connect(terminal)
      raise(Electronics::InvalidTerminal, "'#{terminal}' is not a terminal") unless terminal.is_a?(Terminal)
      raise(Electronics::InvalidTerminal, "Cannot connect a terminal to itself") if terminal == self
      raise(Electronics::InvalidTerminal, "Terminal is already connected") if @connections.include?(terminal)
      @connections << terminal
      terminal.connections << self
    end
  end
end
