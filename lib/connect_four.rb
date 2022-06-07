# frozen_string_literal: true

# Create board object that can be updated and check for winners
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
