require 'spec_helper'

describe Integer do
  it "returns the same number for base units" do
    expect(42.V).to eq 42
    expect(42.A).to eq 42
    expect(42.Ohm).to eq 42
    expect(42.F).to eq 42
  end

  it "returns e-3 for the milli" do
    expect(42.mV).to eq 0.042
  end

  it "returns e-6 for the micro" do
    expect(42.uV).to eq 0.000_042
  end

  it "returns e-9 for the nano" do
    expect(42.nV).to eq 0.000_000_042
  end

  it "returns e-12 for the pico" do
    expect(42.pV).to eq 0.000_000_000_042
  end
end
