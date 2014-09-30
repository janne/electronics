require 'spec_helper'

describe Circuit do
  let(:circuit) { described_class.new }
  describe "#new" do
    it "allows instanciating a new circuit" do
      expect(circuit).to be_an_instance_of(Circuit)
    end

    it "has no components initially" do
      expect(circuit.components).to be_empty
    end
  end

  describe "#components" do
    let(:component) { Component.new(circuit) }
    it "has components" do
      expect(circuit.components).to eq [component]
    end
  end

  describe "#add" do
    it "does not allow non components" do
      expect { circuit.add(true) }.to raise_error(InvalidComponent, "'true' is not a component")
    end
  end

  context "with components" do
    before do
      @dc1 = Source::DC.new(circuit, voltage: 5.V)
      @dc2 = Source::DC.new(circuit, voltage: 5.V)
      @dc3 = Source::DC.new(circuit, voltage: 5.V)
    end

    context "without connections" do
      describe "#nodes" do
        it "is empty" do
          expect(circuit.nodes).to be_empty
        end
      end
    end

    context "with one connection" do
      before do
        @dc1.gnd.connect @dc2.vcc
      end

      describe "#ground_nodes" do
        it "returns the only node" do
          expect(circuit.ground_nodes).to eq circuit.nodes
        end
      end
    end

    context "with serial connections" do
      before do
        @dc1.gnd.connect @dc2.vcc
        @dc2.gnd.connect @dc3.vcc
      end

      describe "#nodes" do
        it "returns one node per connection" do
          expect(circuit.nodes.length).to eq 2
        end
      end

      describe "#ground_nodes" do
        it "returns the first node" do
          expect(circuit.ground_nodes).to eq [circuit.nodes.first]
        end
      end

      describe "#analyze!" do
        it "resets all nodes" do
          n1, n2 = circuit.nodes
          expect(n1).to receive(:reset!)
          expect(n2).to receive(:reset!)
          circuit.analyze!
        end

        it "sets the ground node to 0 volt" do
          circuit.analyze!
          expect(circuit.nodes.first.voltage).to eq 0
        end

        it "sets the other node to -5v" do
          circuit.analyze!
          expect(@dc2.gnd.node.voltage).to eq -5.V
        end

        context "with fourth DC" do
          before do
            @dc4 = Source::DC.new(circuit, voltage: 5.V)
            @dc3.gnd.connect @dc4.vcc
          end
          it "sets the third node to -10v" do
            circuit.analyze!
            expect(@dc4.vcc.node.voltage).to eq -10.V
          end
        end
      end
    end

    context "with parallel connections" do
      before do
        @dc1.vcc.connect @dc2.vcc
      end

      it "has a node, the ground node, with 5V" do
        circuit.analyze!
        expect(circuit.nodes.length).to eq 1
        expect(circuit.nodes).to eq circuit.ground_nodes
        expect(circuit.ground_nodes.first.voltage).to eq 0.V
      end
    end

    context "with ground" do
      before do
        @gnd = Source::Ground.new(circuit)
        @dc1.gnd.connect @gnd.gnd
        @dc2.gnd.connect @dc1.vcc
        @dc3.gnd.connect @dc2.vcc
      end

      it "has ground zero" do
        circuit.analyze!
        expect(@gnd.gnd.node.voltage).to eq 0.V
      end

      it "calculates from ground" do
        circuit.analyze!
        expect(@dc3.gnd.node.voltage).to eq 10.V
      end
    end
  end
end
