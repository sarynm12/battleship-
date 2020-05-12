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
end

  # pry(main)> cruiser.sunk?
  # #=> false
  #
  # pry(main)> cruiser.hit
  #
  # pry(main)> cruiser.health
  # #=> 2
  #
  # pry(main)> cruiser.hit
  #
  # pry(main)> cruiser.health
  # #=> 1
  #
  # pry(main)> cruiser.sunk?
  # #=> false
  #
  # pry(main)> cruiser.hit
  #
  # pry(main)> cruiser.sunk?
  # #=> true
