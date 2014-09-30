Ruby Electronics Simulator
--------------------------

Simulate electronic circuits in Ruby code.

Example:

```ruby
$ bin/bench
circuit = Circuit.new
ground = Source::Ground.new circuit
battery1 = Source::DC.new circuit, voltage: 1.V
battery2 = Source::DC.new circuit, voltage: 100.mV
battery1.gnd.connect ground.gnd
battery2.gnd.connect battery1.vcc
circuit.analyze!
battery2.gnd.voltage == 1.V
```
