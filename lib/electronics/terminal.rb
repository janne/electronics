module Electronics
  class Terminal
    attr_reader :name, :connections
    def initialize(opts = {})
      @name = opts.fetch(:name, "")
      @voltage = opts.fetch(:voltage, nil)
      @connections = opts.fetch(:connections, [])
    end

    def voltage
      @voltage || 0
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
