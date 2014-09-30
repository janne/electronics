require 'spec_helper'

describe Source::Ground do
  let(:circuit) { Circuit.new }
  let(:ground) { described_class.new(circuit) }

  it "has zero voltage" do
    expect(ground.voltage).to eq 0.V
  end

  it "has one terminal, gnd" do
    expect(ground.terminals.length).to eq 1
    expect(ground.terminals.first.name).to eq 'gnd'
  end
end
