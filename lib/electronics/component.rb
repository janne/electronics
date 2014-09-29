module Electronics
  class Component
    attr_reader :name, :pins
    def initialize(opts = {})
      @name = opts.fetch(:name, "")
      @pins = opts.fetch(:pins, {})
    end

    def method_missing(m, *args)
      if @pins.has_key?(m)
        @pins[m]
      else
        super
      end
    end
  end
end

