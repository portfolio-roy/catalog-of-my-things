require_relative 'item'

class Label < Item
  attr_accessor :title, :color
  attr_reader :id, :items

  def initialize(title, color, dictionary = {}, id: Random.rand(1..1000))
    super(dictionary)
    @id = id
    @title = title
    @color = color
    @items = []
  end

  def add_item(item)
    @items << item
    item.label = self
  end

  def to_json(*_args)
    {
      id: @id,
      title: @title,
      color: @color,
      items: @items
    }
  end
end
