require 'spec_helper'

describe Node do
  let(:component) { Component.new(terminals: %w[a b c]) }
  let(:node) { described_class.new(component.terminals[:a], component.terminals[:b]) }
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
      expect { node.add(component.terminals[:a]) }.to raise_error(InvalidTerminal, "Terminal is already connected")
    end
    it "can add more terminals" do
      expect { node.add(component.terminals[:c]) }.to change(node.terminals, :length).from(2).to(3)
    end
  end
end
