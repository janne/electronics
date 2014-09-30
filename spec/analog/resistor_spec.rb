require 'spec_helper'

describe Analog::Resistor do
  let(:circuit) { Circuit.new }
  let(:resistor) { described_class.new(circuit) }

  it "has a resistance of 1 kOhm by default" do
    expect(resistor.resistance).to eq 1.kOhm
  end

  it "has two terminals - a and b" do
    expect(resistor.terminals.length).to eq 2
    expect(resistor.a).to be_a Terminal
    expect(resistor.b).to be_a Terminal
  end
end
