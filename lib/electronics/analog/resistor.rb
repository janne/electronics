module Electronics
  module Analog
    class Resistor < Component
      attr_reader :resistance
      def initialize(circuit, opts = {})
        super(circuit, {terminals: %w[a b]}.merge(opts))
        @resistance = opts.fetch(:resistance, 1.kOhm)
      end
    end
  end
end
