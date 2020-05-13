http://www.jessespevack.com/blog/2016/7/21/all-your-battleship-are-belong-to-us

class Ship
  attr_reader :name,
              :length,
              :health

  def initialize(name, length)
    @name = name
    @length = length
    @health = length
  end

  def sunk?
    if health > 0
      false
    else
      true
    end
  end

  def hit
    @health -= 1
  end
end

class Cell
  attr_reader :coordinate,
              :ship

  def initialize(coordinate)
    @coordinate = coordinate
    @ship = nil
  end

  def empty?
    if ship == nil
      true
    else
      false
    end
  end





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








require 'minitest/autorun'
require 'minitest/pride'
require './lib/ship'
require 'pry'

class ShipTest < Minitest::Test
  def setup
    @cruiser = Ship.new("Cruiser", 3)
  end

  def test_it_exists
    assert_instance_of Ship, @cruiser
  end

  def test_it_has_name_and_length
    assert_equal "Cruiser", @cruiser.name
    assert_equal 3, @cruiser.length
  end

  def test_it_has_health_points_that_equal_length
    assert_equal 3, @cruiser.health
  end

  def test_it_starts_not_sunk
    assert_equal false, @cruiser.sunk?
  end

  def test_health_drops_by_one_point_after_hit
    @cruiser.hit
    assert_equal 2, @cruiser.health
    @cruiser.hit
    assert_equal 1, @cruiser.health
  end

  def test_it_is_sunk_with_one_health_point
    assert_equal false, @cruiser.sunk?
  end
