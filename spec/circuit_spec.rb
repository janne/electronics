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
      @c1 = Source::DC.new(circuit, voltage: 5.V)
      @c2 = Source::DC.new(circuit, voltage: 5.V)
      @c3 = Source::DC.new(circuit, voltage: 5.V)
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
        @c1.gnd.connect @c2.vcc
      end

      describe "#ground_nodes" do
        it "returns the only node" do
          expect(circuit.ground_nodes).to eq circuit.nodes
        end
      end
    end

    context "with connections" do
      before do
        @c1.gnd.connect @c2.vcc
        @c2.gnd.connect @c3.vcc
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
          expect(circuit.nodes.first).to receive(:voltage=).with(0)
          circuit.analyze!
        end

        it "sets the other node to 5v" do
          expect(@c2.gnd.node).to receive(:voltage=).with(-5.V)
          circuit.analyze!
        end
      end
    end
  end
end
