module Electronics
  class Component
    attr_reader :name
    def initialize(opts = {})
      @name = opts.fetch(:name, "")
    end
  end
end

