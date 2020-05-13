class Ship
  attr_reader :name, :length

  def initialize(name, length)
    @name = name
    @length = length
    @health = length
  end

  def hit
    health -= 1
  end

  def sunk?
    health > 0
      false
  end

end
