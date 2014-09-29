module Electronics
  class Terminal
    attr_reader :name, :component
    attr_accessor :node
    def initialize(component, opts = {})
      @component = component
      @name = opts.fetch(:name, "")
      @node = nil
    end

    def connect(terminal)
      raise(Electronics::InvalidTerminal, "'#{terminal}' is not a terminal") unless terminal.is_a?(Terminal)
      raise(Electronics::InvalidTerminal, "Cannot connect a terminal to itself") if terminal == self
      raise(Electronics::InvalidTerminal, "Terminal is already connected") unless @node.nil?
      raise(Electronics::InvalidTerminal, "Terminal belongs to another circuit") if terminal.component.circuit != component.circuit
      if terminal.node.nil?
        @node = Node.new(self, terminal)
        terminal.node = @node
      else
        @node = terminal.node
        @node.add(self)
      end
    end
  end
end
