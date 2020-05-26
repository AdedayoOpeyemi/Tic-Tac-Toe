#!/usr/bin/env ruby

require_relative '../lib/players'
require_relative '../lib/game_status'

class Board
  attr_accessor :board

  def initialize
      @board = [1, 2, 3, 4, 5, 6, 7, 8, 9]
      @count = 1
      @game_status = Game_status.new
  end

  def display_board
      puts "#{@board[0]} | #{@board[1]} | #{@board[2]}\n---------\n#{@board[3]} | #{@board[4]} | #{@board[5]}\n---------\n#{@board[6]} | #{@board[7]} | #{@board[8]}"
  end

  def welcome
    puts 'Welcome to Tic Tac Toe'
    puts 'Player X please input your name'
    name = gets.strip
    @player_1 = Player.new(name, "X")
    puts 'Player O please input your name'
    name = gets.strip
    @player_2 = Player.new(name, "O")
  end

  def current_player
    current_player = if @count.odd?
        @player_1
      else
        @player_2
      end
    end

  def turn
    game_over = false

    puts "#{current_player.name} it is your turn, please make your move choosing between 1 to 9"
    input_board
    display_board
    if @game_status.win_check(@board)
      puts "#{current_player.name} is the winner"
      @game_over = true
    end

    if @game_status.draw?(@count)
        puts "The game is a draw"
        @game_over = true
    end
    @count += 1
  
    current_player
  end
  
  def input_board
    move = gets.strip
    until @game_status.valid_move?(move, @board)
        puts "Please enter a valid input between 1 to 9"
        move = gets.strip
    end
    @board[move.to_i - 1] = current_player.sign
  end  

#   while game_on
#     puts `clear`
#     puts game_board.display_board

#     

#     gamecheck = game_board.board[move.to_i - 1]
#     puts 'Move is not valid, Make a valid move' unless move.to_i == gamecheck
#     current_player.record << move.to_i
#     game_board.board[move.to_i - 1] = current_player.sign
    
#     count += 1
#     if count == 10
#       puts 'The game is a draw'
#       break
#     end
#   end

  def game_play
    welcome
    puts `clear`
    display_board
    until @game_over
        turn
    end
  end

end

game_board = Board.new
game_board.game_play
