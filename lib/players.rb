class Player
  attr_reader :name, :sign, :player_list
  @@player_list = []

  def initialize(name, sign)
    @name = name
    @sign = sign
    @@player_list << self
  end

  def self.player_list
    @@player_list
  end

  def self.current_player(count)
    if count.odd?
      Player.player_list[0]
    else
      Player.player_list[1]
    end
  end
end
