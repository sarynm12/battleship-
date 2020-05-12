class Ship
  attr_reader :name, :length

  def initialize(name, length)
    @name = name
    @length = length
  end

  def health
    health = length
  end

  def hit

  end

  def sunk?
    health > 0
      false
  end

end
