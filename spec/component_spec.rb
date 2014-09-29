require 'spec_helper'

describe Electronics::Component do
  let(:component) { described_class.new }

  describe "#name" do
    let(:component_with_name) { described_class.new(name: 'foo') }
    it "has no name by default" do
      expect(component.name).to be_empty
    end

    it "can have a name" do
      expect(component_with_name.name).to eq 'foo'
    end
  end
end
