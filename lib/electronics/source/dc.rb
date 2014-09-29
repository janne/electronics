module Electronics
  module Source
    class DC < Component
      attr_reader :voltage
      def initialize(circuit, opts = {})
        super(circuit, {terminals: %w[gnd vcc]}.merge(opts))
        @voltage = opts.fetch(:voltage, 9.V)
      end
    end
  end
end
