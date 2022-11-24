require_relative './item'
require 'date'

class Label < Item
  attr_accessor :title, :color, :items
  attr_reader :id, :publish_date

  def initialize(title, color)
    super(id = Random.rand(1..1000))
    @id = id
    @title = title
    @color = color
    @items = []
  end

  def add_item(item)
    (item.is_a?(Item) && @items.include?(item)) || (@items << item)
    item.add_label(self)
  end
end
