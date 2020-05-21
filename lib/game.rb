require './lib/board'
require './lib/turn'
require 'pry'

class Game
  attr_reader :user_input,
              :computer_board,
              :user_board,
              :computer_cruiser,
              :computer_sub,
              :user_cruiser,
              :user_sub

  def initialize
    @user_input = nil
  end

  def start
    while @user_input != "q"
      print "Welcome to BATTLESHIP \n" +
            "Enter p to play. Enter q to quit.\n >"
      @user_input = gets.chomp
      while !(@user_input == "q" || @user_input ==  "p")
        puts "Invalid input, try again:"
        puts ">"
      end
      if @user_input == "p"
        setup
        play_game
      end
    end
    puts "Thanks for playing"
  end

  def setup
    @computer_board = Board.new
    @user_board = Board.new
    @computer_cruiser = Ship.new("Cruiser", 3)
    @computer_sub = Ship.new("Submarine", 2)
    @user_cruiser = Ship.new("Cruiser", 3)
    @user_submarine = Ship.new("Submarine", 2)
    computer_place_ships
    user_place_ships
  end

  def computer_place_ships
    loop do
      @comp_submarine_coordinates = [rand(65..68).chr + "#{rand(1..4)}", rand(65..68).chr + "#{rand(1..4)}"]
      if @computer_board.valid_placement?(@computer_sub, @comp_submarine_coordinates)
        @computer_board.place(@computer_sub, @comp_submarine_coordinates)
        break
      end
    end
    loop do
      @comp_cruiser_coordinates = [rand(65..68).chr + "#{rand(1..4)}", rand(65..68).chr + "#{rand(1..4)}", rand(65..68).chr + "#{rand(1..4)}"]
      if @computer_board.valid_placement?(@computer_cruiser, @comp_cruiser_coordinates)
        @computer_board.place(@computer_cruiser, @comp_cruiser_coordinates)
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
      @user_submarine_coordinates = gets.chomp.split(" ")
      if @user_board.valid_placement?(@user_submarine, @user_submarine_coordinates)
        break
      else
        puts "Invalid coordinates, try again:"
        puts ">"
      end
    end
    @user_board.place(@user_submarine, @user_submarine_coordinates)
  end

  def play_game
    computer_render = nil
    user_render = nil
    while !(computer_render == 5 || user_render == 5)
      @turn = Turn.new(@computer_board, @user_board)
      @turn.take_turn
      computer_render = @computer_board.render.count "X"
      user_render = @user_board.render.count "X"
    end
    end_game(computer_render, user_render)
  end

  def end_game(computer_render, user_render)
    if computer_render == 5
      puts "You win!"
    elsif user_render == 5
      puts "Computer wins!"
    end
  end
end
