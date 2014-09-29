module Electronics
  class Component
    attr_reader :name, :terminals, :circuit
    def initialize(circuit, opts = {})
      @circuit = circuit
      @circuit.add(self)
      @name = opts.fetch(:name, "")
      @terminals = {}
      opts.fetch(:terminals, []).each do |name|
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

