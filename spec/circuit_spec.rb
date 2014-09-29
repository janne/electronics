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
end
