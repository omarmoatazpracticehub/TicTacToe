require_relative "../lib/player.rb"

describe Player do 
	subject(:player) {Player.new("Omar")}

	# def true_return(array)
	# 	it "returns true" do
	# 			player.chosen_cells = array
	# 			expect(player.check_winner?).to eql(true)
	# 	end
	# end

	describe "when object is valid" do 
		it "has a name" do
			expect(player.name).to_not eql("")
		end

		it "has empty chosen cells" do
			expect(player.chosen_cells).to eql([])
		end
	end
	
	describe "#check_winner?" do
		context "when right diagonal" do
			it "returns true" do
				player.chosen_cells = [1,5,9]
				expect(player.check_winner?).to eql(true)
			end	
		end

		context "when left diagonal" do
			it "returns true" do
				player.chosen_cells = [3,5,7]
				expect(player.check_winner?).to eql(true)
			end
		end

		context "when first row" do
			it "returns true" do
				player.chosen_cells = [1,2,3]
				expect(player.check_winner?).to eql(true)
			end
		end

		context "when second row" do
			it "returns true" do
				player.chosen_cells = [4,5,6]
				expect(player.check_winner?).to eql(true)
			end
		end

		context "when third row" do
			it "returns true" do
				player.chosen_cells = [7,8,9]
				expect(player.check_winner?).to eql(true)
			end
		end

		context "when first column" do
			it "returns true" do
				player.chosen_cells = [1,4,7]
				expect(player.check_winner?).to eql(true)
			end
		end

		context "when second column" do
			it "returns true" do
				player.chosen_cells = [2,5,8]
				expect(player.check_winner?).to eql(true)
			end
		end

		context "when third column" do 
			it "returns true" do
				player.chosen_cells = [3,6,9]
				expect(player.check_winner?).to eql(true)
			end
		end
	end
end