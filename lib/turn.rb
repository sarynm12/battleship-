class Turn

  attr_reader :computer_board, :user_board, :computer_cruiser, :computer_sub, :user_cruiser, :user_sub

  def initialize(user_board, computer_board)
    @computer_board = computer_board
    @user_board = user_board
    @computer_cruiser = Ship.new("Cruiser", 3)
    @computer_sub = Ship.new("Submarine", 2)
    @user_cruiser = Ship.new("Cruiser", 3)
    @user_sub = Ship.new("Submarine", 2)
  end


end

  # def place_computer_ship(ship, coordinates)
  #   cruiser_coordinates = [["A1", "A2", "A3"],["A2", "A3", "A4"],["B1", "B2", "B3"],["B2", "B3", "B4"],["C1", "C2", "C3"],["C2", "C3", "C4"],["D1", "D2", "D3"],["D2", "D3", "D4"],["A1", "B1", "C1"],["B1", "C1", "D1"],["A2", "B2", "C2"],["B2", "C2", "D2"],["A3", "B3", "C3"],["B3", "C3", "D3"],["A4", "B4", "C4"],["B4", "C4", "D4"]]
  #   binding.pry
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
