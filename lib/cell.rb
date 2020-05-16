class Cell
  attr_reader :coordinate,
              :ship

  def initialize(coordinate)
    @coordinate = coordinate
    @ship = nil
    @fired_upon = false
  end

  def empty?
    @ship == nil
  end

  def place_ship(ship)
    @ship = ship
  end

  def fired_upon?
    @fired_upon
  end

  def fire_upon
    @fired_upon = true
    if empty? == false
      @ship.hit
    end
  end

  def render(optional = false)
    if empty? == false && @fired_upon == false && optional == true
      "S"
    elsif empty? == true && @fired_upon == true
      "M"
    elsif empty? == false && @ship.sunk? == true
      "X"
    elsif empty? == false && @fired_upon == true
      "H"
    else
      "."
    end
  end
end
