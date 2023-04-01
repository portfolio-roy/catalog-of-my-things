class Genre
  attr_accessor :name
  attr_reader :id, :items

  def initialize(name, array_of_items, id: Time.now.to_i)
    @id = id
    @name = name
    @items = array_of_items || []
  end

  def add_item(item)
    item.genre = self
    @items << item unless @items.include?(item)
  end

  def to_json(*_args)
    {
      id: @id,
      name: @name,
      items: @items
    }
  end

  def to_s
    "Genre: #{@id} - #{@name}"
  end
end
