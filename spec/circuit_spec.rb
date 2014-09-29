require 'spec_helper'

describe Electronics::Circuit do
  let(:circuit) { described_class.new }
  describe "#new" do
    it "allows instanciating a new circuit" do
      expect(circuit).to be_an_instance_of(Electronics::Circuit)
    end

    it "should have no components initially" do
      expect(circuit.components).to be_empty
    end
  end

  describe "#add" do
    let(:component) { Electronics::Component.new }
    it "should allow adding components" do
      circuit.add(component)
      expect(circuit.components).to eq [component]
    end

    it "should now allow non components" do
      expect { circuit.add(true) }.to raise_error(Electronics::InvalidComponent, "'true' is not a component")
    end
  end
end
