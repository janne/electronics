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
      nodes.each(&:reset!)
      ground_nodes.each(&:make_ground)
    end

    def ground_nodes
      gnds = @components.select{|c| c.is_a?(Source::Ground)}.map(&:gnd).map(&:node)
      return gnds unless gnds.empty?
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
