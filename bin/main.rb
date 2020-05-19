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



  puts 'Player 1 please input your name'
  name = gets.strip
  token = 'X'
  player_1 = Player.new(name, token)
  puts 'Player 2 please input your name'
  name = gets.strip
  token = 'O'
  player_2 = Player.new(name, token)
  game_board = Board.new

  win_combination = [[1, 2, 3], [4, 5, 6], [7, 8, 9], [1, 4, 7], [2, 5, 8], [3, 6, 9], [1, 5, 9], [3, 5, 7]]
  count = 1
  game_on = true

  while (game_on == true)
    puts game_board.display_board
    if (count % 2).odd?
        current_player = player_1
    else
        current_player = player_2
    end
    puts "#{current_player.name} it is your turn, please make your move"
    move = gets.strip

    if move != game_board.board[move.to_i - 1].to_s # && /\d/.~match(move) 
      puts 'Move is not valid, Make a valid move'
    end

    current_player.record << move
    game_board.board[move.to_i - 1] = current_player.sign
    #if win_check(win_combination, current_player.record) 
      #game_on = false
    #end
    count += 1
  end
