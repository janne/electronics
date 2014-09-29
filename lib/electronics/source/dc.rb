module Electronics
  module Source
    class DC < Component
      attr_reader :voltage
      def initialize(opts = {})
        super(opts)
        @voltage = opts.fetch(:voltage, 9.V)
        @terminals[:gnd] = Terminal.new
        @terminals[:vcc] = Terminal.new(voltage: @voltage)
      end
    end
  end
end
