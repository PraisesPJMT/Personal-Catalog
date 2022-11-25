require './item'
require 'date'

# create game class
class Game < Item
  attr_accessor :multiplayer, :last_played_at

  def initialize(multiplayer, last_played_at, *args)
    @multiplayer = multiplayer
    @last_played_at = last_played_at
    super(*args)
  end

  # return true if parent's method returns true AND if last_played_at is older than 2 years
  private

  def can_be_archived?
    super && (Date.now.year - Date.parse(@last_played_at).year) > 2
  end
end
