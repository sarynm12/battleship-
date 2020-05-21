require './lib/ship'

class Turn

  attr_reader :computer_board,
              :user_board,
              :computer_cruiser,
              :computer_sub,
              :user_cruiser,
              :user_sub,
              :computer_message

  def initialize(computer_board, user_board)
    @computer_board = computer_board
    @user_board = user_board
  #   @computer_cruiser = Ship.new("Cruiser", 3)
  #   @computer_sub = Ship.new("Submarine", 2)
  #   @user_cruiser = Ship.new("Cruiser", 3)
  #   @user_sub = Ship.new("Submarine", 2)
  end

  def take_turn
    puts "=============COMPUTER BOARD============="
    puts @computer_board.render
    puts "==============USER BOARD=============="
    puts @user_board.render(true)
    puts "Enter the coordinate for your shot:"
    puts ">"
    user_takes_shot
    computer_takes_shot
    user_board_render
    computer_board_render
  end

  def user_takes_shot
    loop do
      @user_shot = gets.chomp
        if @computer_board.valid_coordinate?(@user_shot) == false
          puts "Please enter a valid coordinate:"
          puts ">"
        elsif  @computer_board.cells[@user_shot].fired_upon?
          puts "This coordinate has already been fired upon."
          puts "Please enter a valid coordinate:"
          puts ">"
        else
          break
        end
    end
    @computer_board.cells[@user_shot].fire_upon
  end

  def computer_takes_shot
    loop do
      @computer_shot = rand(65..68).chr + (rand(1..4)).to_s
      if @user_board.cells[@computer_shot].fired_upon? == false && @user_board.valid_coordinate?(@computer_shot)
        break
      end
    end
    @user_board.cells[@computer_shot].fire_upon
  end

  def user_board_render
    if @user_board.cells[@computer_shot].render == "M"
      @computer_message = "was a miss"
    elsif @user_board.cells[@computer_shot].render == "H"
      @computer_message = "was a hit"
    elsif @user_board.cells[@computer_shot].render == "X"
      @computer_message = "has sunk a ship"
        #do we need an else statement?
    end
  end

  def computer_board_render
    if @computer_board.cells[@user_shot].render == "M"
        user_message = "was a miss"
    elsif @computer_board.cells[@user_shot].render == "H"
        user_message = "was a hit"
    elsif @computer_board.cells[@user_shot].render == "X"
        user_message = "has sunk a ship"
    end
    puts " "
    puts "==============RESULTS=============="

    puts "Your shot on #{user_shot} #{user_message}."
    puts "My shot on #{computer_shot} #{computer_message}."
  end
end
