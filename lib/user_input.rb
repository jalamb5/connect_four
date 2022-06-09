# frozen_string_literal: true

require_relative '../lib/game_board'

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
