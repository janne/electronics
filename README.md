Ruby Electronics Simulator
--------------------------

Simulate electronic circuits in Ruby code.

Example:

```ruby
$ bin/bench
circuit = Circuit.new
battery1 = Source::DC.new circuit, voltage: 1.V
battery2 = Source::DC.new circuit, voltage: 100.mV
battery2.gnd.connect battery1.vcc
```
