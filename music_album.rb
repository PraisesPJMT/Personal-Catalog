require_relative 'item'

class MusicAlbum < Item
  attr_accessor :on_spotify, :name

  def initialize(on_spotify, name, publish_date, id = Random.rand(1..1_000))
    super(publish_date, id)
    @name = name
    @on_spotify = on_spotify
  end

  private

  def can_be_archived?
    super && @on_spotify
  end
end
