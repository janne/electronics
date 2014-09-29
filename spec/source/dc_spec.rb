require 'spec_helper'

describe Electronics::Source::DC do
  let(:dc) { described_class.new }

  it "inherits component options" do
    dc_with_name = described_class.new(name: "+5V")
    expect(dc_with_name.name).to eq "+5V"
  end

  it "has 9V by default" do
    expect(dc.voltage).to eq 9.V
  end

  it "allows setting voltage" do
    dc_with_5v = described_class.new(voltage: 5.mV)
    expect(dc_with_5v.voltage).to eq 5.mV
  end

  it "has two pins" do
    expect(dc.pins.length).to eq 2
  end

  it "has a voltage diff of 9V by default" do
    voltage = (dc.pins[0].voltage - dc.pins[1].voltage).abs
    expect(voltage).to eq 9.V
  end
end