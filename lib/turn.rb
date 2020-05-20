class Turn

  attr_reader :computer_board, :user_board, :computer_cruiser, :computer_sub, :user_cruiser, :user_sub

  def initialize
    @computer_cruiser = Ship.new("Cruiser", 3)
    @computer_sub = Ship.new("Submarine", 2)
    @user_cruiser = Ship.new("Cruiser", 3)
    @user_sub = Ship.new("Submarine", 2)
  end

  def take_turn
  #   puts "=============COMPUTER BOARD============="
  #   puts @computer_board.render
  #   puts "==============PLAYER BOARD=============="
  #   puts @player_board.render(true)
  #   puts "Enter the coordinate for your shot:"
  #   puts ">"
  #
  #   loop do
  #     @player_target = gets.chomp
  #       if @computer_board.valid_coordinate?(@player_target) == false
  #         puts "Please enter a valid coordinate:"
  #         puts ">"
  #       elsif  @computer_board.cells[@player_target].fired_upon?
  #         puts "This coordinate has already been fired upon."
  #         puts "Please enter a valid coordinate:"
  #         puts ">"
  #       else
  #         break
  #       end
  #   end
  #   @computer_board.cells[@player_target].fire_upon
  #
  #   loop do
  #     @computer_target = rand(65..68).chr + (rand(1..4)).to_s
  #     if @player_board.cells[@computer_target].fired_upon? == false && @player_board.valid_coordinate?(@computer_target)
  #       break
  #     end
  #   end
  #   @player_board.cells[@computer_target].fire_upon
  #
  #   if @player_board.cells[@computer_target].render == "M"
  #       computer_message = "was a miss"
  #     elsif @player_board.cells[@computer_target].render == "H"
  #       computer_message = "was a hit"
  #     elsif @player_board.cells[@computer_target].render == "X"
  #       computer_message = "has sunk a ship"
  #   end
  #
  #   if @computer_board.cells[@player_target].render == "M"
  #       player_message = "was a miss"
  #     elsif @computer_board.cells[@player_target].render == "H"
  #       player_message = "was a hit"
  #     elsif @computer_board.cells[@player_target].render == "X"
  #       player_message = "has sunk a ship"
  #   end
  #   puts " "
  #   puts "==============RESULTS=============="
  #
  #   puts "Your shot on #{player_target} #{player_message}."
  #   puts "My shot on #{computer_target} #{computer_message}."
  # end





  #
  #   first = cruiser_coordinates.sample
  #
  #
  #   if @computer_board.valid_placement?(cruiser, first)
  #     @computer_board.place(cruiser, first)
  #   end
  # end

  #   if cruiser_valids.sample
  #     valid_placement?(ship, coordinates)
  #     coordinates.map do |coordinate|
  #       @cells[coordinate].place_ship(ship)
  #     end
  #   end
  # end



#
#     sub_valids = [["A1", "A2"],["A2", "A3"],["A3", "A4"],["B1", "B2"],["B2", "B3"],["B3", "B4"],["C1", "C2"],["C2", "C3"],["C3", "C4"],["D1", "D2"],["D2", "D3"],["D3", "D4"],["A1", "B1"],["B1", "C1"],["C1", "D1"],["A2", "B2"],["B2", "C2"],["C2", "D2"],["A3", "B3"],["B3", "C3"],["C3", "D3"],["A4", "B4"],["B4", "C4"],["C4", "D4"]]
#     sub_valids.sample
#   end
#
#
#   def place_user_ships
#
#     # place_cruiser
#     # place_submarine
#   end
# end


end
