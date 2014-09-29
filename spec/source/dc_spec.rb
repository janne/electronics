require 'spec_helper'

describe Source::DC do
  let(:circuit) { Circuit.new }
  let(:dc) { described_class.new(circuit) }

  it "inherits component options" do
    dc_with_name = described_class.new(circuit, name: "+5V")
    expect(dc_with_name.name).to eq "+5V"
  end

  it "has 9V by default" do
    expect(dc.voltage).to eq 9.V
  end

  it "allows setting voltage" do
    dc_with_5v = described_class.new(circuit, voltage: 5.mV)
    expect(dc_with_5v.voltage).to eq 5.mV
  end

  it "has two terminals" do
    expect(dc.terminals.length).to eq 2
  end
end
