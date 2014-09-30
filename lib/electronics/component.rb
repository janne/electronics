module Electronics
  class Component
    attr_reader :name, :terminals, :circuit
    def initialize(circuit, opts = {})
      @circuit = circuit
      @circuit.add(self)
      @name = opts.fetch(:name, "")
      @terminals = opts.fetch(:terminals, []).map{|name| Terminal.new(self, name: name.to_s) }
    end

    def set_voltage_in_relation_to(terminal)
    end

    def respond_to?(m, include_private = false)
      @terminals.any?{|t| t.name == m.to_s }
    end

    def method_missing(m, *args)
      @terminals.detect{|t| t.name == m.to_s } || super
    end
  end
end

