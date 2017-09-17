require_relative 'board.rb'
require_relative 'player.rb'

board = Board.new()
player1 = Player.new('o')
player2 = Player.new('x')

switch = true
current_player = player1

while(!(board.draw? || current_player.check_winner?))
	board.display_board
	if switch == true
		puts "Player X, choose a position:"
		current_player = player2
	else
		puts "Player O, choose a position:"
		current_player = player1
	end
	input = gets.chomp
	while !(input =~ /\d/ || input.length > 1)
		puts "invalid input, try again"
		input = gets.chomp
	end
	board.mark_cell(input.to_i, switch)
	current_player.chosen_cells << input.to_i
	switch = !switch
end

if board.draw?
	puts "The game is a draw!"
else
	puts "Player #{current_player.name.upcase!} wins!"
end