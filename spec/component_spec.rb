require 'spec_helper'

describe Component do
  let(:circuit) { Circuit.new }
  let(:component) { described_class.new(circuit) }

  describe "#name" do
    let(:component_with_name) { described_class.new(circuit, name: 'foo') }
    it "has no name by default" do
      expect(component.name).to be_empty
    end

    it "can have a name" do
      expect(component_with_name.name).to eq 'foo'
    end
  end

  describe "#terminals" do
    it "has no terminals by default" do
      expect(component.terminals).to be_empty
    end

    context "with terminals" do
      let(:component_with_terminals) { described_class.new(circuit, terminals: %w[vcc gnd]) }

      it "has two terminals" do
        expect(component_with_terminals.terminals.length).to eq 2
      end

      it "answers to terminals by name" do
        expect(component_with_terminals.vcc).to be_a Terminal
      end

      it "has terminals that know what component they belong to" do
        expect(component_with_terminals.vcc.component).to eq component_with_terminals
      end
    end
  end
end
