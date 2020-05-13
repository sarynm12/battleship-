http://www.jessespevack.com/blog/2016/7/21/all-your-battleship-are-belong-to-us

def test_it_can_place_ship
  #binding.pry
  assert_equal nil, @cell.place_ship("Cruiser")
end

def test_it_knows_if_it_has_been_fired_at
  assert_equal false, @cell.fired_upon?
  assert_equal true, @cell.fired_upon?
end

def place_ship(ship)
  @ship
end

def fire_upon
  @cell.ship.health
end

def fired_upon?
  @health -= 1
end
