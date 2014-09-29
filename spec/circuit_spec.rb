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

  describe "#add" do
    let(:component) { Component.new }
    it "should allow adding components" do
      circuit.add(component)
      expect(circuit.components).to eq [component]
    end

    it "should now allow non components" do
      expect { circuit.add(true) }.to raise_error(InvalidComponent, "'true' is not a component")
    end
  end
end
