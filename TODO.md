- Add Circuit#analyze
  - [Nodal analysis](http://en.wikipedia.org/wiki/Nodal_analysis)
  - [Network analysis](http://en.wikipedia.org/wiki/Network_analysis_(electrical_circuits))
  - [PDF](http://www.ee.ic.ac.uk/hp/staff/dmb/courses/ccts1/00300_Nodal.pdf)

  - Replace Component#terminals w/ array
  - Add
    - Source::Ground
      - No need to find ground_node then
    - Analog::Resistor
