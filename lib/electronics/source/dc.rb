module Electronics
  module Source
    class DC < Component
      attr_reader :voltage
      def initialize(opts = {})
        @voltage = opts.fetch(:voltage, 9)
        super(opts)
      end
    end
  end
end
