module Electronics
  class Node
    attr_reader :terminals
    attr_accessor :voltage, :current

    def initialize(terminal1, terminal2)
      @terminals = [terminal1, terminal2]
      reset!
    end

    def reset!
      @voltage = @current = nil
    end

    def make_ground
      set_voltage(0)
    end

    def set_voltage(voltage, exclude = nil)
      @voltage = voltage
      terminals.reject{|t| exclude && t == exclude}.each do |terminal|
        terminal.component.set_voltage_in_relation_to(terminal)
      end
    end

    def add(terminal)
      raise(InvalidTerminal, "'#{terminal}' is not a terminal") unless terminal.is_a?(Terminal)
      raise(InvalidTerminal, "Terminal is already connected") if @terminals.include?(terminal)
      @terminals << terminal
    end
  end
end
