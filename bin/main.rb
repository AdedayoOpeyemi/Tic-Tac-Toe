#!/usr/bin/env ruby

class Board
  attr_accessor :board

  def initialize
    @board = [1, 2, 3, 4, 5, 6, 7, 8, 9]
  end

  def display_board
    puts "#{board[0]} | #{board[1]} | #{board[2]}\n---------\n#{board[3]} | #{board[4]} | #{board[5]}\n---------
    \n#{board[6]} | #{board[7]} | #{board[8]}"
  end
end

class Player
  attr_reader :name, :sign
  attr_accessor :record

  def initialize(name, sign)
    @name = name
    @sign = sign
    @record = []
  end
end

def win_check(win_combination, player_record)
  win_combination.each do |win|
    win.all? { |win1| player_record.include?(win1) }
  end
end

def Game_Cycle(player_1, player_2, board)
  win_combination = [[1, 2, 3], [4, 5, 6], [7, 8, 9], [1, 4, 7], [2, 5, 8], [3, 6, 9], [1, 5, 9], [3, 5, 7]]
  count = 1
  game_on = true

  while (game_on = true)
    puts board.display_board
    current_player = (count % 2).odd? ? player_1 : player_2
    puts "#{current_player.name} it is your turn, please make your move"
    move = gets.strip

    if move != board.board[move.to_i - 1] && move != [/\d/]
      puts 'Move is not valid, Make a valid move'
    end

    current_player.record << move
    board.board[move.to_i - 1] = current_player.sign
    if win_check(win_combination, current_player.record) then game_on = false
    count += 1
  end
end

# Player 1 details assignment
puts 'Player 1 please input your name'
name = gets.strip
token = 'X'
Player_1 = Player.new(name, token)
puts 'Player 2 please input your name'
name = gets.strip
token = 'O'
Player_2 = Player.new(name, token)
game_board = Board.new
Game_Cycle(player_1, player_2, game_board)
