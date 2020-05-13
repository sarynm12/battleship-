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

  def test_it_starts_empty
    assert_equal true, @cell.empty?
  end

  def test_it_can_hold_ship
    cruiser = Ship.new("Cruiser", 3)
    @cell.place_ship(cruiser)
    assert_equal cruiser, @cell.ship
  end

  def test_it_knows_it_has_been_fired_upon
    skip
    assert_equal false, @cell.fired_upon?
    @cell.fire_upon
    assert_equal true, @cell.fired_upon?
  end
end
