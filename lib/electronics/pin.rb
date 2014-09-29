module Electronics
  class Pin
    attr_reader :name, :connections
    def initialize(opts = {})
      @name = opts.fetch(:name, "")
      @voltage = opts.fetch(:voltage, nil)
      @connections = opts.fetch(:connections, [])
    end

    def voltage
      @voltage || 0
    end

    def connect(pin)
      raise(Electronics::InvalidPin, "'#{pin}' is not a pin") unless pin.is_a?(Pin)
      raise(Electronics::InvalidPin, "Cannot connect a pin to itself") if pin == self
      raise(Electronics::InvalidPin, "Pin is already connected") if @connections.include?(pin)
      @connections << pin
      pin.connections << self
    end
  end
end
