require 'minitest/autorun'
require 'minitest/pride'
require './lib/board'
require './lib/ship'
require 'pry'

class BoardTest < Minitest::Test

  def setup
    @board = Board.new
  end

  def test_it_exists
    assert_instance_of Board, @board
  end

  def test_it_has_cells
    assert_instance_of Hash, @board.cells
    assert_equal 16, @board.cells.count
    assert_instance_of Cell, @board.cells["A1"]
    assert_instance_of Cell, @board.cells["B4"]
  end

  def test_it_has_valid_coordinate
    assert_equal true, @board.valid_coordinate?("A1")
    assert_equal true, @board.valid_coordinate?("D4")
    assert_equal false, @board.valid_coordinate?("A5")
    assert_equal false, @board.valid_coordinate?("E1")
    assert_equal false, @board.valid_coordinate?("A22")
  end

  def test_it_has_same_number_of_coordinates_as_ship_length
    cruiser = Ship.new("Cruiser", 3)
    submarine = Ship.new("Submarine", 2)

    assert_equal false, @board.valid_placement?(cruiser, ["A1", "A2"])
    assert_equal true, @board.valid_placement?(cruiser, ["B1", "B2", "B3"])
    assert_equal false, @board.valid_placement?(submarine, ["A2", "A3", "A4"])
    assert_equal true, @board.valid_placement?(submarine, ["C1", "C2"])
  end

  def test_it_has_consecutive_and_ascending_coordinates
    cruiser = Ship.new("Cruiser", 3)
    submarine = Ship.new("Submarine", 2)

    assert_equal false, @board.valid_placement?(cruiser, ["A1", "A2", "A4"])
    assert_equal false, @board.valid_placement?(submarine, ["A1", "C1"])
    assert_equal false, @board.valid_placement?(cruiser, ["A3", "A2", "A1"])
    assert_equal false, @board.valid_placement?(submarine, ["C1", "B1"])
  end

end
