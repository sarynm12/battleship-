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

  def test_it_is_sunk_when_health_equals_zero
    @cruiser.hit
    assert_equal 2, @cruiser.health
    @cruiser.hit
    assert_equal 1, @cruiser.health
    @cruiser.hit
    assert_equal 0, @cruiser.health
    assert_equal true, @cruiser.sunk?
  end
end
