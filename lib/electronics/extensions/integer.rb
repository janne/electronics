class Integer
  def self.units(prefix = nil)
    %w[V A Ohm F].map{|unit| "#{prefix}#{unit}".to_sym }
  end

  def base_unit
    self
  end
  units.each {|unit| alias_method unit, :base_unit}

  def milli_unit
    self/1000.0
  end
  units('m').each {|unit| alias_method unit, :milli_unit}

  def micro_unit
    self/1000_000.0
  end
  units('u').each {|unit| alias_method unit, :micro_unit}

  def nano_unit
    self/1000_000_000.0
  end
  units('n').each {|unit| alias_method unit, :nano_unit}

  def pico_unit
    self/1000_000_000_000.0
  end
  units('p').each {|unit| alias_method unit, :pico_unit}
end
