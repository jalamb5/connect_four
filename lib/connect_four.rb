# frozen_string_literal: true

# Create board object that can be updated and check for winners
class GameBoard
  attr_accessor :board
  attr_reader :board_header

  def initialize
    @board_header = [0, 1, 2, 3, 4, 5, 6]
    @board = [
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

  def winner?
    # check when board has 4 same colored discs (vert., horiz., diag.)
    row_winner = row_win(board)
    column_winner = column_win(board)

    return row_winner unless row_winner.nil?
    return column_winner unless column_winner.nil?
  end

  private

  def row_win(board)
    board.each do |row|
      i = row.each_cons(4).find { |a| a.uniq.size == 1 && a.first != '-' }
      return i.first unless i.nil?
    end
    nil
  end

  def column_win(board)
    # rotate board
    rotated_board = board.transpose.reverse
    # use row_win to find 4 in a row
    i = row_win(rotated_board)
    i
  end
end

# Create an object and validate it for each user's move
class UserInput
  attr_reader :column, :player

  def initialize(player, column, board)
    @player = player
    @column = validator(column, board)
    @board = board
  end

  private

  def validator(column, board)
    error_message = "Error: You can not choose a column that is full\n"
    column_values = []
    board.each { |row| column_values << row[column] }
    if column_values.include?('-')
      column
    else
      puts error_message
    end
  end
end
