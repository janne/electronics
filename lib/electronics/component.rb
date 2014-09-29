module Electronics
  class Component
    attr_reader :name, :terminals
    def initialize(opts = {})
      @name = opts.fetch(:name, "")
      @terminals = opts.fetch(:terminals, {})
    end

    def method_missing(m, *args)
      if @terminals.has_key?(m)
        @terminals[m]
      else
        super
      end
    end
  end
end

