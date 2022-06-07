# create a board that is 7 across by 6 down
# create 2 players (red, yellow)
# ask player 1 to choose a column
# drop disc into place
# check for a winner
# ask player 2 to choose a column
# drop disc into place
# check for a winner

class GameBoard
  attr_accessor :board

  def initialize
    @board = [
      [0, 1, 2, 3, 4, 5, 6],
      ['-', '-', '-', '-', '-', '-', '-'],
      ['-', '-', '-', '-', '-', '-', '-'],
      ['-', '-', '-', '-', '-', '-', '-'],
      ['-', '-', '-', '-', '-', '-', '-'],
      ['-', '-', '-', '-', '-', '-', '-'],
      ['-', '-', '-', '-', '-', '-', '-']
    ]
  end

  def update_board(player, column)
    reversed_board = board.reverse
    reversed_board.each do |row|
      if row[column] == '-'
        row[column] = player
        break
      end
    end
    self.board = reversed_board.reverse
  end
end

# Create an object and validate it for each user's move
class UserInput
  def initialize(player, column, board)
    @player = player
    @column = validator(column)
    @board = board
  end

  private

  def validator(column, board)
    error_message = "Error: You can not choose a column that is full\n"
    board.each { |row| column_values << row[column] }
    if column_values.contains?('-')
      column
    else
      puts error_message
      # call for input
    end

  end
end
