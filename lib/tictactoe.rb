require_relative 'board.rb'
require_relative 'player.rb'

class TicTacToe
	def initialize
		@board = Board.new()
		@players = [Player.new('o'), Player.new('x')]
	end

	def run
		player_flag = 0
		current_player = @players[player_flag]
		while(!(current_player.check_winner? || @board.game_end?))
			@board.display_board
			current_player = @players[player_flag]
			print "Player #{current_player.name}, choose position: "
			input = recieve_input
			while(input == -1)
				input = recieve_input
			end
			@board.mark_cell(input.to_i, current_player) 
			mark_player_cells(current_player, input)
			player_flag = 1 - player_flag
		end

		if current_player.check_winner? == true
			puts "Player #{current_player.name.upcase!} wins!"
		else
			puts "It's a draw!"
		end
	end
	private
	def mark_player_cells(current_player, input)
		current_player.chosen_cells << input.to_i
	end
	def validate_input? (input)
		return false if !(input.to_s =~ /\d/ || input.length > 1)
		return true
	end
	def recieve_input 
		input = gets.chomp
		if validate_input?(input) != true
			return -1
		else
			return input
		end
	end

end


ttt = TicTacToe.new
ttt.run