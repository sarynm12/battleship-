require 'minitest/autorun'
require 'minitest/pride'
require './lib/turn'
require './lib/board'
require './lib/ship'
require 'pry'

class TurnTest < Minitest::Test

  def setup
    @computer_cruiser = Ship.new("Cruiser", 3)
    @computer_sub = Ship.new("Submarine", 2)
    @user_cruiser = Ship.new("Cruiser", 3)
    @user_sub = Ship.new("Submarine", 2)
    @turn = Turn.new(@computer_board, @user_board)
  end

  def test_it_exists
    assert_instance_of Turn, @turn
  end

  def test_it_places_ship_randomly
    skip

    assert_equal false, first[0].empty?
  end

end
