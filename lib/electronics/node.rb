module Electronics
  class Node
    attr_reader :terminals

    def initialize(terminal1, terminal2)
      @terminals = [terminal1, terminal2]
    end

    def add(terminal)
      raise(Electronics::InvalidTerminal, "'#{terminal}' is not a terminal") unless terminal.is_a?(Terminal)
      raise(Electronics::InvalidTerminal, "Terminal is already connected") if @terminals.include?(terminal)
      @terminals << terminal
    end
  end
end