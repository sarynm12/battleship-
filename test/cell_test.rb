require 'minitest/autorun'
require 'minitest/pride'
require './lib/ship'
require './lib/cell'
require 'pry'

class CellTest < Minitest::Test

  def setup
    @cell = Cell.new("B4")
  end

  def test_it_exists
    assert_instance_of Cell, @cell
  end

  def test_it_can_read_coordinate
    assert_equal "B4", @cell.coordinate
  end

  def test_it_starts_with_no_ship
    assert_equal nil, @cell.ship
  end

  def test_it_knows_when_it_is_empty
    assert_equal true, @cell.empty?
  end






end


# pry(main)> cell.empty?
# # => true
#
# pry(main)> cruiser = Ship.new("Cruiser", 3)
# # => #<Ship:0x00007f84f0891238...>
#
# pry(main)> cell.place_ship(cruiser)
#
# pry(main)> cell.ship
# # => #<Ship:0x00007f84f0891238...>
#
# pry(main)> cell.empty?
# # => false




# pry(main)> cell.fired_upon?
# # => false
#
# pry(main)> cell.fire_upon
#
# pry(main)> cell.ship.health
# # => 2
#
# pry(main)> cell.fired_upon?
# # => true
