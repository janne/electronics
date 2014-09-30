require 'spec_helper'

describe Circuit do
  let(:circuit) { described_class.new }
  describe "#new" do
    it "allows instanciating a new circuit" do
      expect(circuit).to be_an_instance_of(Circuit)
    end

    it "should have no components initially" do
      expect(circuit.components).to be_empty
    end
  end

  describe "#components" do
    let(:component) { Component.new(circuit) }
    it "should have components" do
      expect(circuit.components).to eq [component]
    end
  end

  describe "#add" do
    it "should not allow non components" do
      expect { circuit.add(true) }.to raise_error(InvalidComponent, "'true' is not a component")
    end
  end

  describe "#nodes" do
    it "should be empty without components" do
      expect(circuit.nodes).to be_empty
    end

    it "should be empty without connections" do
      3.times { Source::DC.new(circuit) }
      expect(circuit.nodes).to be_empty
    end

    it "should return one node per connection" do
      cs = Array.new(3).map{ Source::DC.new(circuit) }
      cs[0].gnd.connect cs[1].vcc
      cs[1].gnd.connect cs[2].vcc
      expect(circuit.nodes.length).to eq 2
    end
  end

  describe "#ground_node" do
    it "returns the only node, if available" do
      cs = Array.new(2).map{ Source::DC.new(circuit) }
      cs[0].gnd.connect cs[1].vcc
      expect(circuit.ground_node).to eq circuit.nodes.first
    end
  end
end
