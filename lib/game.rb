# frozen_string_literal: true

require_relative '../lib/user_input'
require_relative '../lib/game_board'

# Create game instance and play
class Game
  attr_accessor :board

  def initialize
    board = GameBoard.new
    play_game(board)
  end

  def play_game(board)
    puts 'Welcome to connect four'
    game_loop(board) until board.winner?
    puts 'Thanks for playing!'
  end

  def game_loop(board)
    board.print_board
    puts 'Player Y'
    player_move('Y', board)
    board.print_board
    puts 'Player R'
    player_move('R', board)
  end

  def player_move(player, board)
    puts 'Choose a column'
    move = gets.chomp.to_i
    board.update_board(player, move)
    # else
    #   player_move(player, board)
  end
end

Game.new
