#!/usr/bin/env ruby

require_relative '../lib/players'
require_relative '../lib/game_status'
require_relative '../lib/board'

game_board = Board.new
puts 'Welcome to Tic Tac Toe'
puts ''
puts 'Player X please input your name'
name = gets.strip
@player1 = Player.new(name, 'X')
puts 'Player O please input your name'
name = gets.strip
until name != @player1.name
  puts 'please input a different name, that name is already taken'
  name = gets.strip
end
@player2 = Player.new(name, 'O')
puts game_board.display_board
count = 1

loop do
  game_over = false
  game_status = GameStatus.new
  to_play = Player.current_player(count)
  puts "#{to_play.name} it is your turn, please make your move choosing between 1 to 9"
  move = gets.strip
  until game_status.valid_move?(move, game_board.board)
    puts 'Please enter a valid input between 1 to 9 that has not been taken'
    move = gets.strip
  end
  game_board.input_board(to_play, move)
  puts game_board.display_board
  if game_status.win_check(game_board.board)
    puts "#{to_play.name} is the winner"
    return game_over = true
  end
  if game_status.draw?(count) && !game_status.win_check(game_board.board)
    puts 'The game is a draw'
    return game_over = true
  end
  count += 1
  break if game_over
end
