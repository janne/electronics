require 'spec_helper'

describe Terminal do
  let(:component) { Component.new }
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
      expect { terminal2.connect(terminal) }.to change(terminal2.connections, :length).from(0).to(1)
    end
    it "is connected in the other direction as well" do
      expect { terminal2.connect(terminal) }.to change(terminal.connections, :length).from(0).to(1)
    end
    it "is only possible to connect other terminals" do
      expect { terminal.connect(true) }.to raise_error(InvalidTerminal, "'true' is not a terminal")
    end
    it "is not possible to connect a terminal twice" do
      expect { terminal.connect(terminal2); terminal.connect(terminal2) }.to raise_error(InvalidTerminal, "Terminal is already connected")
    end
  end
end
