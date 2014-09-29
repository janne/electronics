module Electronics
  class Component
    attr_reader :name, :pins
    def initialize(opts = {})
      @name = opts.fetch(:name, "")
      @pins = opts.fetch(:pins, [])
    end
  end
end

