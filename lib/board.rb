class Board
	attr_accessor :board_cells
	def initialize
		@board_cells = []
		9.times do |i|
			@board_cells << i + 1
		end
	end

	def game_end?
		return @board_cells.none? {|x| x.to_s =~ /[1-9]/}
	end

	def determine_player(player_flag)
		current_player = nil
		if player_flag == false
			current_player = 'o'
		else
			current_player = 'x'
		end
		return current_player
	end

	def mark_cell(position, current_player)
		if @board_cells[position - 1].to_s =~ /\d/
			@board_cells[position - 1] = current_player.name if current_player.name =~ /[ox]/
		end
		return @board_cells[position - 1]
	end

	def display_board
		@board_cells.each_with_index do |element, index|
			print "#{element} "
			print "\n" if (index + 1) % 3 == 0
		end
	end
end