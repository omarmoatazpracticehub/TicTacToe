class Player
	attr_reader :name
	attr_accessor :chosen_cells
	def initialize(name)
		@name = name
		@chosen_cells = []
	end
	def check_winner?
		return check_diagonal? || check_vertical? || check_horizontal?
	end
	def check_diagonal?
		if @chosen_cells.any? {|x| x == 1} &&
		   @chosen_cells.any? {|x| x == 5} &&
		   @chosen_cells.any? {|x| x == 9} ||
		   @chosen_cells.any? {|x| x == 7} &&
		   @chosen_cells.any? {|x| x == 5} &&
		   @chosen_cells.any? {|x| x == 3}
			return true
		end
		return false
	end
	def check_horizontal?
		if @chosen_cells.any? {|x| x == 1} &&
		   @chosen_cells.any? {|x| x == 2} &&
		   @chosen_cells.any? {|x| x == 3} ||
		   @chosen_cells.any? {|x| x == 4} &&
		   @chosen_cells.any? {|x| x == 5} &&
		   @chosen_cells.any? {|x| x == 6} ||
		   @chosen_cells.any? {|x| x == 7} &&
		   @chosen_cells.any? {|x| x == 8} &&
		   @chosen_cells.any? {|x| x == 9}
			return true
		end
		return false 
	end
	def check_vertical?
		if  @chosen_cells.any? {|x| x == 1} && 
			@chosen_cells.any? {|x| x == 4} && 
			@chosen_cells.any? {|x| x == 7} ||
			@chosen_cells.any? {|x| x == 2} && 
			@chosen_cells.any? {|x| x == 5} && 
			@chosen_cells.any? {|x| x == 8} || 
			@chosen_cells.any? {|x| x == 3} && 
			@chosen_cells.any? {|x| x == 6} && 
			@chosen_cells.any? {|x| x == 9}
			return true
		end
		return false
	end
end