require 'minitest/autorun'
require 'minitest/pride'
require './lib/board'
require 'pry'

class BoardTest < Minitest::Test

  def setup
    @board = Board.new
  end

  def test_it_exists
    assert_instance_of Board, @board
  end

  def test_that_cells_method_returns_hash

    # we can assert what we do know about this hash.
    # it should have 16 key/value pairs, and those keys point to cell objects.

    assert_instance_of Hash, @board.cells
    assert_equal 16, @board.cells.count
    assert_instance_of Cell, @board.cells["A1"]
    assert_instance_of Cell, @board.cells["B4"]
  end
end
