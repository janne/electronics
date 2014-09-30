module Electronics
  class Circuit
    attr_reader :components

    def initialize
      @components = []
    end

    def add(component)
      raise InvalidComponent, "'#{component}' is not a component" unless component.is_a? Component
      @components << component
    end

    def analyze!
      # Rest all nodes
      nodes.each(&:reset!)

      # Set ground voltage
      ground_nodes.each{|node| node.voltage = 0 }

      # Set voltage on other side of components connected to ground voltage
      ground_nodes.map(&:terminals).flatten.each do |terminal|
        terminal.component.set_voltage_in_relation_to(terminal)
      end
    end

    def ground_nodes
      dc_ground = nodes.detect do |node|
        gnds = node.terminals.select{|t| t.respond_to?(:gnd) }
        if !gnds.empty?
          gnds.any?{|g| g.component.is_a?(Source::DC)}
        end
      end
      dc_ground.nil? ? [nodes.first] : [dc_ground]
    end

    def nodes
      terminals.map(&:node).compact.uniq
    end

    private

    def terminals
      @components.map{|c| c.terminals }.flatten.uniq
    end
  end
end
