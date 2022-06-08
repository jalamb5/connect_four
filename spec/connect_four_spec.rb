# frozen_string_literal: true

require_relative '../lib/connect_four'

describe GameBoard do
  describe '#update_board' do
    let(:red_disc) { 'R' }
    let(:yellow_disc) { 'Y' }

    subject(:disc_placement) { described_class.new }
    context 'when red player chooses a column' do
      let(:player_column) { 5 }

      before do
        subject.update_board(red_disc, player_column)
      end

      it 'drops a red disc into the selected column' do
        updated_location = subject.board[5][player_column]
        expect(updated_location).to eq(red_disc)
      end
    end
    context 'when yellow player chooses a column' do
      let(:player_column) { 3 }

      before do
        subject.update_board(yellow_disc, player_column)
      end

      it 'drops a red disc into the selected column' do
        updated_location = subject.board[5][player_column]
        expect(updated_location).to eq(yellow_disc)
      end
    end
    context 'when a player chooses a column that already has discs' do
      let(:used_column) { 1 }

      before do
        subject.update_board(yellow_disc, used_column)
        subject.update_board(red_disc, used_column)
      end

      it 'places the new disc atop the existing ones' do
        above_row = subject.board[4][used_column]
        expect(above_row).to eq(red_disc)
      end
    end
  end

  describe '#winner?' do
    context 'when a player has 4 discs in a row' do
      subject(:row_winner) { described_class.new }
      before do
        # Stack 4 discs in bottom row
        subject.update_board('Y', 0)
        subject.update_board('Y', 1)
        subject.update_board('Y', 2)
        subject.update_board('Y', 3)
      end

      it 'returns winner' do
        expect(subject.winner?).to eq('Y')
      end
    end

    context 'when a player has 4 discs in a column' do
      subject(:column_winner) { described_class.new }
      before do
        # Stack 4 discs in column 1
        4.times { subject.update_board('R', 1) }
      end

      it 'returns winner' do
        expect(subject.winner?).to eq('R')
      end
    end
  end
end

describe UserInput do
  describe '#validator' do
    context 'when a player chooses a valid location' do
      let(:game_board) { GameBoard.new }
      subject(:valid_input) { described_class.new('R', 1, game_board.board) }
      it 'returns the location' do
        # take user input, return if valid
        subject.column == 1
      end
    end
    context 'when a player chooses an invalid location' do
      let(:full_board) { GameBoard.new }

      before do
        6.times { full_board.update_board('Y', 2) }
      end

      it 'returns error message' do
        expect do
          described_class.new('R', 2, full_board.board)
        end.to output("Error: You can not choose a column that is full\n").to_stdout
      end
    end
  end
end
