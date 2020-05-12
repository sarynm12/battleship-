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
end



  # pry(main)> cruiser.name
  # #=> "Cruiser"
  #
  # pry(main)> cruiser.length
  # #=> 3
  #
  # pry(main)> cruiser.health
  # #=> 3
  #
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
