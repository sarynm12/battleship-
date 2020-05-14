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

  def render
    if @fired_upon == false
      "."
    end 
  end
end


# does this make sense?
# grid {cell: "coordinate"}
#
# grid = {cell_1: "A1",
#         cell_2: "A2",
#       etc., etc.}






# cell_1 = Cell.new("A1")
# cell_2 = Cell.new("A2")
# cell_3 = Cell.new("A3")
# cell_4 = Cell.new("A4")
# cell_5 = Cell.new("B1")
# cell_6 = Cell.new("B2")
# cell_7 = Cell.new("B3")
# cell_8 = Cell.new("B4")
# cell_9 = Cell.new("C1")
# cell_10 = Cell.new("C2")
# cell_11 = Cell.new("C3")
# cell_12 = Cell.new("C4")
# cell_13 = Cell.new("D1")
# cell_14 = Cell.new("D2")
# cell_15 = Cell.new("D3")
# cell_16 = Cell.new("D4")
