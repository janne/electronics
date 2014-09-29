Ruby Electronics Simulator
--------------------------

Simulate electronic circuits in Ruby code.

Example:

    $ bin/bench
    circuit = Circuit.new
    dc = circuit.add(Source::DC.new(voltage: 1500.mV * 2))
