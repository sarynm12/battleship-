require 'minitest/autorun'
require 'minitest/pride'
require './lib/game'
require './lib/board'
require './lib/ship'
require 'pry'


class GameTest < Minitest::Test

  def setup
    @game = Game.new
  end

  def test_it_exists
    assert_instance_of Game, @game
  end

  def test_it_starts_by_printing_welcome_message
    expected = "Welcome to BATTLESHIP \n" +
               "Enter p to play. Enter q to quit.\n >"
    assert_equal expected, @game.welcome
    assert_equal expected, @game.start
  end

  def test_it_can_respond_to_invalid_input
    @game.start
    expected = "Invalid input, try again: \n" + ">"
    assert_equal expected, @game.setup
  end
end
