require_relative './item'
require 'date'

class Label
  attr_accessor :title, :color
  attr_reader :id, :items

  def initialize(title, color)
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
