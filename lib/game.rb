require './lib/board'
require 'pry'

class Game
  attr_reader :welcome

  def initialize
    @welcome = "Welcome to BATTLESHIP \n" +
               "Enter p to play. Enter q to quit.\n >"
  end

  def start
    welcome
  end
end
