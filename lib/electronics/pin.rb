module Electronics
  class Pin
    attr_reader :name
    def initialize(opts = {})
      @name = opts.fetch(:name, "")
      @voltage = opts.fetch(:voltage, nil)
    end

    def voltage
      @voltage || 0
    end
  end
end
