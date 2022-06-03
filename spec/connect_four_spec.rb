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
    context 'when a player chooses a column that is full' do
      let(:full_column) { 2 }

      before do
        6.times { subject.update_board(yellow_disc, full_column) }
      end
      it 'displays an error message' do
        expect do
          subject.update_board(yellow_disc, full_column)
        end.to output("Error: You can not choose a column that is full\n").to_stdout
      end
    end
  end
end
