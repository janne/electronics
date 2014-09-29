require 'spec_helper'

describe Component do
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

  describe "#terminals" do
    it "has no terminals by default" do
      expect(component.terminals).to be_empty
    end

    context "with terminals" do
      let(:vcc) { Terminal.new(voltage: 5.V) }
      let(:gnd) { Terminal.new(voltage: 0.V) }
      let(:terminals) { { vcc: vcc, gnd: gnd } }
      let(:component_with_terminals) { described_class.new terminals: terminals }

      it "has two terminals" do
        expect(component_with_terminals.terminals.length).to eq 2
      end

      it "answers to terminals by name" do
        expect(component_with_terminals.vcc).to eq vcc
      end
    end
  end
end
