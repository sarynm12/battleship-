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

  def test_coordinates_cannot_be_diagonal_and_previous_tests_pass
    cruiser = Ship.new("Cruiser", 3)
    submarine = Ship.new("Submarine", 2)
    assert_equal false, @board.valid_placement?(cruiser, ["A1", "B2", "C3"])
    assert_equal false, @board.valid_placement?(submarine, ["C2", "D3"])
    assert_equal true, @board.valid_placement?(submarine, ["A1", "A2"])
    assert_equal true, @board.valid_placement?(cruiser, ["B1", "C1", "D1"])
  end

  def test_it_can_place_ships
    cruiser = Ship.new("Cruiser", 3)
    @board.place(cruiser, ["A1", "A2", "A3"])
    cell_1 = @board.cells["A1"]
    cell_2 = @board.cells["A2"]
    cell_3 = @board.cells["A3"]
    assert_equal cruiser, cell_1.ship
    assert_equal cruiser, cell_2.ship
    assert_equal cruiser, cell_3.ship
    assert_equal true, cell_3.ship == cell_2.ship
  end

  def test_it_does_not_let_ships_overlap
    cruiser = Ship.new("Cruiser", 3)
    @board.place(cruiser, ["A1", "A2", "A3"])
    submarine = Ship.new("Submarine", 2)
    assert_equal false, @board.valid_placement?(submarine, ["A1", "B1"])
  end

  def test_it_has_valid_ship_placement
    cruiser = Ship.new("Cruiser", 3)
    submarine = Ship.new("Submarine", 2)
    assert_equal false, @board.valid_placement?(cruiser, ["A1", "A2"])
  end

  def test_it_can_render
    cruiser = Ship.new("Cruiser", 3)
    @board.place(cruiser, ["A1", "A2", "A3"])
    #binding.pry
    assert_equal "  1 2 3 4 \nA . . . . \nB . . . . \nC . . . . \nD . . . . \n", @board.render
    assert_equal "  1 2 3 4 \nA S S S . \nB . . . . \nC . . . . \nD . . . . \n", @board.render(true)
  end
end
