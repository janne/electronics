require 'spec_helper'

describe Node do
  let(:circuit) { Circuit.new }
  let(:component) { Component.new(circuit, terminals: %w[a b c]) }
  let(:node) { described_class.new(component.a, component.b) }
  describe "#new" do
    it "has two terminals as a start" do
      expect(node.terminals.length).to eq 2
    end
  end

  describe "#add" do
    it "only accepts terminals" do
      expect { node.add(true) }.to raise_error(InvalidTerminal, "'true' is not a terminal")
    end
    it "only accepts unique terminals" do
      expect { node.add(component.a) }.to raise_error(InvalidTerminal, "Terminal is already connected")
    end
    it "can add more terminals" do
      expect { node.add(component.c) }.to change(node.terminals, :length).from(2).to(3)
    end
  end

  describe "#voltage" do
    it "is initially 0" do
      expect(node.voltage).to eq 0.V
    end

    it "can be set" do
      node.voltage = 20.mV
      expect(node.voltage).to eq 20.mV
    end
  end

  describe "#current" do
    it "is initially 0" do
      expect(node.current).to eq 0.A
    end

    it "can be set" do
      node.current = 10.mA
      expect(node.current).to eq 10.mA
    end
  end

  describe "#reset" do
    it "resets the voltage" do
      node.voltage = 5.V
      expect { node.reset! }.to change(node, :voltage).from(5.V).to(0.V)
    end
    it "resets the current" do
      node.current = 20.mA
      expect { node.reset! }.to change(node, :current).from(20.mA).to(0.mA)
    end
  end
end
