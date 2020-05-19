require './lib/board'
require 'pry'

class Game
  attr_reader :welcome,
              :player_input

  def initialize
    @welcome = "Welcome to BATTLESHIP \n" +
               "Enter p to play. Enter q to quit.\n >"
  end

  def start
    welcome
  end

  def setup
    @player_input = nil
    loop do
      # do we need to switch the order of line 19 and line 21?
      @player_input = gets.chomp
      if @player_input == "q" || @player_input ==  "p"
        break
      else
        puts "Invalid input, try again:"
        puts ">"
      end
    end
  end
end


# def initialize(player_info)
#   @ships = player_info[:ships]
# end
