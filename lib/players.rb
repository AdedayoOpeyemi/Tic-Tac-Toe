class Player
  attr_reader :name, :sign
  attr_accessor :record

  def initialize(name, sign)
    @name = name
    @sign = sign
    @record = []
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