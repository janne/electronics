module Electronics
  module Source
    class DC < Component
      attr_reader :voltage
      def initialize(circuit, opts = {})
        super(circuit, {terminals: %w[gnd vcc]}.merge(opts))
        @voltage = opts.fetch(:voltage, 9.V)
      end

      def set_voltage_in_relation_to(base_terminal)
        set_terminal = base_terminal == gnd ? vcc : gnd
        voltage = base_terminal == gnd ? @voltage : -@voltage
        if set_terminal.node
          raise AnalyzeError if set_terminal.node.voltage
          set_terminal.node.set_voltage(base_terminal.node.voltage + voltage, set_terminal)
        end
      end
    end
  end
end
