require_relative 'item'

class MusicAlbum < Item
  attr_accessor :on_spotify, :name

  def initialize(on_spotify, name, publish_date)
    super(publish_date)
    @name = name
    @on_spotify = on_spotify
    @archived = can_be_archived?
  end

  private

  def can_be_archived?
    super && @on_spotify
  end
end
