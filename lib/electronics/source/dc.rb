module Electronics
  module Source
    class DC < Component
      attr_reader :voltage
      def initialize(opts = {})
        super({terminals: %w[gnd vcc]}.merge(opts))
        @voltage = opts.fetch(:voltage, 9.V)
      end
    end
  end
end
