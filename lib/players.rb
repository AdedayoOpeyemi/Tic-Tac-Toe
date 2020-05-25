class Player
  attr_reader :name, :sign
  attr_accessor :record

  def initialize(name, sign)
    @name = name
    @sign = sign
    @record = []
  end
end