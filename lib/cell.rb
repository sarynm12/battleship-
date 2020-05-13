class Cell
  attr_reader :coordinate,
              :ship

  def initialize(coordinate)
    @coordinate = coordinate
    @ship = nil
  end

  def empty?
    ship.nil?
  end

  def place_ship
    #not entirely sure how to start this one
    #at this point, it has nowhere to go
    #ship.nil? == false
    empty? == false
  end

  def fire_upon

  end

  def fired_upon?
    if @cell.fire_upon
      true
    else
      false
    end
  end

end
