require './item'

# create game class
class Game < Item
  attr_accessor :multiplayer, :last_played_at

  def initialize (multiplayer, last_played_at)
    @multiplayer = multiplayer
    @last_played_at = last_played_at
  end
  
# return true if parent's method returns true AND if last_played_at is older than 2 years
  def can_be_archived?
    super && Date.today.year - Date.parse(@last_played_at).year > 2
  end
end