require 'spec_helper'

describe Electronics::Source::DC do
  let(:dc) { described_class.new }

  it "inherits component options" do
    dc_with_name = described_class.new(name: "+5V")
    expect(dc_with_name.name).to eq "+5V"
  end
end
