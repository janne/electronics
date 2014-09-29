module Electronics
  module Source
    class DC < Component
      attr_reader :voltage
      def initialize(opts = {})
        super(opts)
        @voltage = opts.fetch(:voltage, 9.V)
        @pins << Pin.new(name: '+', voltage: @voltage)
        @pins << Pin.new(name: '-', voltage: 0.V)
      end
    end
  end
end
