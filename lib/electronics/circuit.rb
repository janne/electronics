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

    def ground_node
      nodes.detect do |node|
        gnds = node.terminals.select{|t| t.name == 'gnd'}
        if gnds.empty?
          nodes.first
        else
          dc_gnd = gnds.detect{|g| g.component.is_a?(Source::DC)}
          dc_gnd.nil? ? gnds.first.node : dc_gnd.node
        end
      end
    end

    def nodes
      terminals.map(&:node).compact.uniq
    end

    private

    def terminals
      @components.map{|c| c.terminals.values }.flatten.uniq
    end
  end
end
