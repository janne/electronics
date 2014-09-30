require 'spec_helper'

describe Terminal do
  let(:circuit) { Circuit.new }
  let(:component) { Component.new(circuit) }
  let(:terminal) { described_class.new(component) }
  it "has blank name by default" do
    expect(terminal.name).to eq ""
  end
  it "has the given component" do
    expect(terminal.component).to eq component
  end

  describe "#connect" do
    let(:terminal2) { described_class.new(component) }
    it "can connect one terminal to another" do
      expect { terminal2.connect(terminal) }.to change(terminal2, :node).from(nil)
    end
    it "is only possible to connect other terminals" do
      expect { terminal.connect(true) }.to raise_error(InvalidTerminal, "'true' is not a terminal")
    end
    it "is not possible to connect a terminal twice" do
      expect { terminal.connect(terminal2); terminal.connect(terminal2) }.to raise_error(InvalidTerminal, "Terminal is already connected")
    end
    it "is not possible to connect to another circuit" do
      invalid = Terminal.new(Component.new(Circuit.new))
      expect { terminal.connect(invalid) }.to raise_error(InvalidTerminal, "Terminal belongs to another circuit")
    end
    it "is connected to an existing node, if available" do
      terminal3 = described_class.new(component)
      terminal3.connect(terminal2)
      terminal.connect(terminal2)
      expect(terminal.node).to eq terminal2.node
      expect(terminal2.node).to eq terminal3.node
    end
  end

  describe "#voltage" do
    it "calls voltage on it's node" do
      terminal.node = double(:node, voltage: 5.V)
      expect(terminal.voltage).to eq 5.V
    end
  end
end
