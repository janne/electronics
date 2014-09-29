require 'spec_helper'

describe Electronics::Pin do
  let(:pin) { described_class.new }
  it "has blank name and zero voltage by default" do
    expect(pin.name).to eq ""
    expect(pin.voltage).to eq 0
  end

  describe "#connect" do
    let(:pin2) { described_class.new }
    it "can connect one pin to another" do
      expect { pin2.connect(pin) }.to change(pin2.connections, :length).from(0).to(1)
    end
    it "is connected in the other direction as well" do
      expect { pin2.connect(pin) }.to change(pin.connections, :length).from(0).to(1)
    end
    it "is only possible to connect other pins" do
      expect { pin.connect(true) }.to raise_error(Electronics::InvalidPin, "'true' is not a pin")
    end
    it "is not possible to connect a pin twice" do
      expect { pin.connect(pin2); pin.connect(pin2) }.to raise_error(Electronics::InvalidPin, "Pin is already connected")
    end
  end
end
