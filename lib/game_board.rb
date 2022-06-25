# frozen_string_literal: true

require_relative '../lib/user_input'

# Create board object that can be updated and check for winners
class GameBoard
  attr_accessor :board
  attr_reader :board_header

  def initialize
    @board_header = %w[0 1 2 3 4 5 6]
    @board = [
      ['-', '-', '-', '-', '-', '-', '-'],
      ['-', '-', '-', '-', '-', '-', '-'],
      ['-', '-', '-', '-', '-', '-', '-'],
      ['-', '-', '-', '-', '-', '-', '-'],
      ['-', '-', '-', '-', '-', '-', '-'],
      ['-', '-', '-', '-', '-', '-', '-']
    ]
  end

  def print_board
    puts board_header.to_s
    board.each do |row|
      puts row.to_s
    end
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
    rotated_board = board.transpose
    # use row_win to find 4 in a row
    row_win(rotated_board)
  end
end
