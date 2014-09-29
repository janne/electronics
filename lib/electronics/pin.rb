module Electronics
  class Pin
    attr_reader :name, :voltage
    def initialize(opts = {})
      @name = opts.fetch(:name, "")
      @voltage = opts.fetch(:voltage, nil)
    end
  end
end
