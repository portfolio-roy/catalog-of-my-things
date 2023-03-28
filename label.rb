require_relative 'item'

class Label < Item
  attr_accessor :title, :color
  attr_reader :id, :items

  def initialize(title, color)
    super(id = Random.rand(1..100))
    @id = id
    @title = title
    @color = color
    @items = []
  end

  def add_item(item)
    @items << item
    item.label = self
  end
end
