require_relative '../lib/board.rb'
require_relative '../lib/player.rb'

describe Board do
	subject(:board) {Board.new}
	subject(:players) {[Player.new('o'), Player.new('x')]}
		describe "#initialize" do    
		context "when object is valid" do
			it "board contains numbers [1-9]" do
				board.board_cells.each_with_index do |item, index|
					expect(item).to eql(index + 1)
				end
			end 
		end
	end

	describe "#game_end?" do
		context "when board contains digits" do
			it "returns false" do
				expect(board.game_end?).to eql(false)
			end
		end

		context "when board is completely full" do
			it "returns true" do
				board.board_cells = ['x','o','x','o','x','o','x','o','x']
				expect(board.game_end?).to eql(true)
			end
		end

		context "when board is partially complete" do
			it "returns false" do
				board.board_cells = ['x','o','x',4,5,6,'x','o','x']
				expect(board.game_end?).to eql(false)
			end
		end
	end

	describe "#determine_player" do
		context "when determine_player(false)" do
			it "returns o as current player" do
				expect(board.determine_player(false)).to eql('o')
			end
		end

		context "when determine_player(true)" do
			it "returns x as current player" do
				expect(board.determine_player(true)).to eql('x')
			end
		end
	end

	describe "#mark_cell" do
		before(:each) {board.board_cells = [1,2,3,4,5,6,7,8,9]}
		context "when (invalid position, player, @players)" do
			it "returns nil" do
				expect(board.mark_cell(50, players[0])).to eql(nil)
			end

			it "does not change board" do
				prev_board = board.board_cells
				expect(board.mark_cell(50, players[0]))
			end
		end

		context "when (valid position, player o)" do 
			it "marks player 'o' on grid" do
				expect(board.mark_cell(1, players[0])).to eql('o')
			end
		end

		context "when (valid position, player x)" do
			it "marks player 'x' on grid" do
				expect(board.mark_cell(1,players[1])).to eql('x')
			end
		end
	end
end