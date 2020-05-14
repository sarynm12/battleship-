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

  def test_it_can_render
    cell_1 = Cell.new("B4")
    assert_equal ".", cell_1.render
  end

  def test_it_can_render_M_if_fired_upon_but_no_ship
    cell_1 = Cell.new("B4")
    cell_1.fire_upon
    assert_equal "M", cell_1.render
  end

  def test_it_can_render_with_ship
    cell_2 = Cell.new("C3")
    cruiser = Ship.new("Cruiser", 3)
    cell_2.place_ship(cruiser)
    assert_equal ".", cell_2.render
  end

  def test_it_can_render_s_with_optional_argument
    cell_2 = Cell.new("C3")
    cruiser = Ship.new("Cruiser", 3)
    cell_2.place_ship(cruiser)
    assert_equal "S", cell_2.render(true)
  end

  def test_it_can_render_H_when_hit
    cell_2 = Cell.new("C3")
    cruiser = Ship.new("Cruiser", 3)
    cell_2.place_ship(cruiser)
    cell_2.fire_upon
    assert_equal "H", cell_2.render
  end

  def test_it_starts_unsunk
    cell_2 = Cell.new("C3")
    cruiser = Ship.new("Cruiser", 3)
    cell_2.place_ship(cruiser)
    cell_2.fire_upon
    assert_equal false, cruiser.sunk?
  end

  def test_it_renders_sunken_ship
    cell_2 = Cell.new("C3")
    cruiser = Ship.new("Cruiser", 3)
    cell_2.place_ship(cruiser)
    cell_2.fire_upon
    cruiser.hit
    cruiser.hit
    assert_equal true, cruiser.sunk?
    assert_equal "X", cell_2.render
  end

end
