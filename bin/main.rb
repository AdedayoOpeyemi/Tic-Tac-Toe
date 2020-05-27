#!/usr/bin/env ruby

require_relative '../lib/players'
require_relative '../lib/game_status'

class Board
  attr_reader :board

  def initialize
    @board = [1, 2, 3, 4, 5, 6, 7, 8, 9]
    @count = 1
    @game_status = GameStatus.new
  end

  def display_board
    puts " #{board[0]} | #{board[1]} | #{board[2]}",
         '-' * 11,
         " #{board[3]} | #{board[4]} | #{board[5]}",
         '-' * 11,
         " #{board[6]} | #{board[7]} | #{board[8]}"
  end

  def welcome
    puts 'Welcome to Tic Tac Toe'
    puts ''
  end

  def player_setup
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
  end

  def current_player
    if @count.odd?
      @player1
    else
      @player2
    end
  end

  def turn
    @game_over = false

    puts "#{current_player.name} it is your turn, please make your move choosing between 1 to 9"
    input_board
    display_board
    if @game_status.win_check(@board)
      puts "#{current_player.name} is the winner"
      return @game_over = true
    end

    if @game_status.draw?(@count)
      puts 'The game is a draw'
      return @game_over = true
    end
    @count += 1
    current_player
  end

  def input_board
    move = gets.strip
    until @game_status.valid_move?(move, @board)
      puts 'Please enter a valid input between 1 to 9 that has not been taken'
      move = gets.strip
    end
    @board[move.to_i - 1] = current_player.sign
  end

  def game_play
    welcome
    player_setup
    display_board
    turn until @game_over
  end
end

game_board = Board.new
game_board.game_play

# game_board.welcome
# game_board.player_setup
# game_board.display_board
# game_board.turn until @game_over
