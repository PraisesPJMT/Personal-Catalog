require './item'
require 'date'

# create game class
class Game < Item
  attr_accessor :name, :multiplayer, :last_played_at

  def initialize(name, multiplayer, last_played_at, publish_date)
    super(publish_date)
    @name = name
    @multiplayer = multiplayer
    @last_played_at = last_played_at
    @archived = can_be_archived?
  end

  # return true if parent's method returns true AND if last_played_at is older than 2 years
  private

  def can_be_archived?
    super && Date.today.year - Date.parse(@last_played_at).year > 2
  end
end
