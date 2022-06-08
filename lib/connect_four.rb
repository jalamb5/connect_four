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
    rowwin = row_win(board)
    columnwin = column_win(board)

    return rowwin unless rowwin.nil?
    return columnwin unless columnwin.nil?
  end

  private

  def row_win(board)
    board.each do |row|
      i = row.each_cons(4).find { |a| a.uniq.size == 1 && a.first != '-' }
      return i.first unless i.nil?
    end
  end

  def column_win(board)
    # rotate board
    # use row_win to find 4 in a row
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
