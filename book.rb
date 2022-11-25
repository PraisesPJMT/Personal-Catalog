require_relative './item'
require 'date'

class Book < Item
  attr_accessor :name, :publisher, :cover_state
  attr_reader :id

  def initialize(name, publisher, cover_state, publish_date)
    super(publish_date)
    @name = name
    @publisher = publisher
    @cover_state = cover_state
    @archived = can_be_archived?
  end

  private

  def can_be_archived?
    @archived = if super || @cover_state == 'bad'
                  true
                else
                  false
                end
  end
end
