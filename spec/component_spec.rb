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

  describe "#pins" do
    it "has no pins by default" do
      expect(component.pins).to be_empty
    end

    context "with pins" do
      let(:vcc) { Electronics::Pin.new(voltage: 5.V) }
      let(:gnd) { Electronics::Pin.new(voltage: 0.V) }
      let(:pins) { { vcc: vcc, gnd: gnd } }
      let(:component_with_pins) { described_class.new pins: pins }

      it "has two pins" do
        expect(component_with_pins.pins.length).to eq 2
      end

      it "answers to pins by name" do
        expect(component_with_pins.vcc).to eq vcc
      end
    end
  end
end
