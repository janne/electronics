module Electronics
  module Source
    class DC < Component
      attr_reader :voltage
      def initialize(circuit, opts = {})
        super(circuit, {terminals: %w[gnd vcc]}.merge(opts))
        @voltage = opts.fetch(:voltage, 9.V)
      end

      def set_voltage_in_relation_to(base_terminal)
        set_terminal = terminals.detect{|t| t != base_terminal}
        if set_terminal.node
          raise AnalyzeError if set_terminal.node.voltage
          voltage = set_terminal.name == 'vcc' ? @voltage : -@voltage
          set_terminal.node.voltage = base_terminal.node.voltage + voltage

          # Cascade to nearby components
          (set_terminal.node.terminals - [set_terminal]).map(&:component).each do |c|
            c.set_voltage_in_relation_to(set_terminal)
          end
        end
      end
    end
  end
end
