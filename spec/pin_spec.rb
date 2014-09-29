require 'spec_helper'

describe Electronics::Pin do
  let(:pin) { described_class.new }
  it "has blank name and zero voltage by default" do
    expect(pin.name).to eq ""
    expect(pin.voltage).to eq 0
  end
end
