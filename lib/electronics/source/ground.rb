module Electronics
  module Source
    class Ground < Component
      attr_reader :voltage
      def initialize(circuit, opts = {})
        super(circuit, {terminals: %w[gnd]}.merge(opts))
        @voltage = 0.V
      end
    end
  end
end
