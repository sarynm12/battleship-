require 'minitest/autorun'
require 'minitest/pride'
require './lib/cell'
require './lib/ship'
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
    assert_nil @cell.ship
  end

  def test_it_starts_empty
    assert_equal true, @cell.empty?
  end

  def test_it_can_place_and_hold_a_ship
    cruiser = Ship.new("Cruiser", 3)
    @cell.place_ship(cruiser)
    assert_equal cruiser, @cell.ship
    assert_equal false, @cell.empty?
  end

  def test_it_starts_not_fired_upon
    cruiser = Ship.new("Cruiser", 3)
    @cell.place_ship(cruiser)
    assert_equal false, @cell.fired_upon?
  end

  def test_it_can_be_fired_upon
    @cell.fire_upon
    assert_equal true, @cell.fired_upon?
  end

  def test_ship_health_declines_after_fire_upon_method
    cruiser = Ship.new("Cruiser", 3)
    @cell.place_ship(cruiser)
    @cell.fire_upon 
    assert_equal 2, @cell.ship.health
  end
end


#
# pry(main)> cell.place_ship(cruiser)
#
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
