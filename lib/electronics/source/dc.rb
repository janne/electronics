module Electronics
  module Source
    class DC < Component
      attr_reader :voltage
      def initialize(circuit, opts = {})
        super(circuit, {terminals: %w[gnd vcc]}.merge(opts))
        @voltage = opts.fetch(:voltage, 9.V)
      end

      def set_voltage_in_relation_to(terminal)
        set_node = terminals.detect{|t| t != terminal}.node
        if set_node
          raise AnalyzeError if !set_node.voltage.nil?
          set_node.voltage = (terminal.name == 'gnd' ? @voltage : -@voltage)
        end
      end
    end
  end
end
