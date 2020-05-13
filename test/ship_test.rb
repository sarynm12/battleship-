require 'minitest/autorun'
require 'minitest/pride'
require './lib/ship'
require 'pry'

class ShipTest < Minitest::Test

  def test_it_exists
    cruiser = Ship.new("Cruiser", 3)

    assert_instance_of Ship, cruiser
  end

  def test_it_can_evaluate_health
    cruiser = Ship.new("Cruiser", 3)

    assert_equal 3, cruiser.health
  end

  def test_ship_got_hit
    cruiser = Ship.new("Cruiser", 3)
    binding.pry
    assert_equal 2, cruiser.hit
  end

  def test_has_it_sunk?
    cruiser = Ship.new("Cruiser", 3)

    assert_equal false, cruiser.sunk?
  end

  def test_declare_it_sunk
    skip
    cruiser = Ship.new("Cruiser", 3)

    assert_equal true, cruiser.sunk?
  end
end
