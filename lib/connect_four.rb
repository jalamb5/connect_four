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
