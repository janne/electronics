module Electronics
  module Source
    class DC < Component
      attr_reader :voltage
      def initialize(opts = {})
        super(opts)
        @voltage = opts.fetch(:voltage, 9.V)
        @pins[:gnd] = Pin.new
        @pins[:vcc] = Pin.new(voltage: @voltage)
      end
    end
  end
end
