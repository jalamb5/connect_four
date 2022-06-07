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
        updated_location = subject.board[6][player_column]
        expect(updated_location).to eq(red_disc)
      end
    end
    context 'when yellow player chooses a column' do
      let(:player_column) { 3 }

      before do
        subject.update_board(yellow_disc, player_column)
      end

      it 'drops a red disc into the selected column' do
        updated_location = subject.board[6][player_column]
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
        above_row = subject.board[5][used_column]
        expect(above_row).to eq(red_disc)
      end
    end
  end
end

describe UserInput do
  describe '#validator' do
    context 'when a player chooses a valid location' do
      it 'returns the location' do
        # take user input, return if valid
      end
    end
  end
end
