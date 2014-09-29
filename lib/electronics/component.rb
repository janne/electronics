module Electronics
  class Component
    attr_reader :name, :terminals
    def initialize(opts = {})
      @name = opts.fetch(:name, "")
      terminal_names = opts.fetch(:terminals, [])
      @terminals = {}
      terminal_names.each do |name|
        @terminals[name.to_sym] = Terminal.new(self, name: name.to_s)
      end
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

