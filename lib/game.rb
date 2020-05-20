require './lib/board'
require './lib/turn'
require 'pry'

class Game
  attr_reader :welcome,
              :user_input

  def initialize
    @welcome = "Welcome to BATTLESHIP \n" +
               "Enter p to play. Enter q to quit.\n >"
    @computer_board = Board.new
    @user_board = Board.new
  end

  def start
    welcome
    setup
  end

  def setup
    @user_input = nil
    loop do
      # do we need to switch the order of line 19 and line 21?
      @user_input = gets.chomp
      if @user_input == "q" || @user_input ==  "p"
        valid_input
      else
        puts "Invalid input, try again:"
        puts ">"
      end
    end
  end

  def valid_input
    if @user_input == "q"
      puts "Thanks for playing"
    elsif @user_input == "p"
      computer_place_ships
      user_place_ships
    #play_game
    end
  end

  def computer_place_ships
    loop do
      @comp_submarine_coordinates = [rand(65..68).chr + "#{rand(1..4)}", rand(65..68).chr + "#{rand(1..4)}"]
      if @computer_board.valid_placement?(@comp_submarine, @comp_submarine_coordinates)
        @computer_board.place(@comp_submarine, @comp_submarine_coordinates)
        break
      end
    end
    loop do
      @comp_cruiser_coordinates = [rand(65..68).chr + "#{rand(1..4)}", rand(65..68).chr + "#{rand(1..4)}", rand(65..68).chr + "#{rand(1..4)}"]
      if @computer_board.valid_placement?(@comp_cruiser, @comp_cruiser_coordinates)
        @computer_board.place(@comp_cruiser, @comp_cruiser_coordinates)
        break
      end
    end
  end

  def user_place_ships
    puts "I have laid out my ships on the grid.
    You now need to lay out your two ships.
    The Cruiser is three units long and the Submarine is two units long.
      1 2 3 4
    A . . . .
    B . . . .
    C . . . .
    D . . . .
    Enter the squares for the Cruiser (3 spaces), for example 'A1 B1 C1':"
    puts ">"

    @user_cruiser_coordinates = []
    loop do
      @user_cruiser_coordinates = gets.chomp.split(" ")
      if @user_board.valid_placement?(@user_cruiser, @user_cruiser_coordinates)
        break
      else
        puts "Invalid coordinates, try again:"
        puts ">"
      end
    end

    @user_board.place(@user_cruiser, @user_cruiser_coordinates)
    puts @user_board.render(true)

    puts "Enter the squares for the Submarine (2 spaces):"
    puts ">"

    @user_submarine_coordinates = []
    loop do
      @user_sumarine_coordinates = gets.chomp.split(" ")
      if @user_board.valid_placement?(@user_sumarine, @user_sumarine_coordinates)
        break
      else
        puts "Invalid coordinates, try again:"
        puts ">"
      end
    end
    @user_board.place(@user_submarine, @user_submarine_coordinates)
  end

  def play_game
    # turn = Turn.new
    # turn.take_turn
    # if aflsjld
    #   turn
    # elsif
    # end_game

  end


end


# def initialize(player_info)
#   @ships = player_info[:ships]
