require_relative 'item'

class Label < Item
  attr_accessor :title, :color
  attr_reader :id, :items

  def initialize(dictionary, title, color)
    super(dictionary)
    @id = dictionary['id']
    @title = title
    @color = color
    @items = []
  end

  def add_item(item)
    @items << item
    item.label = self
  end
end
