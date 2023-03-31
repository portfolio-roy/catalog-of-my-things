require 'date'
require_relative 'item'

class Author < Item
    attr_accessor :first_name, :last_name
    attr_reader :id, :items

    def initialize(first_name, last_name, dictionary = {}, id: Random.rand(1..1000))
        super(dictionary)
        @id = id
        @first_name = first_name
        @last_name = last_name
    end

    def add_item
        (item.is_a?(item) && !@items.include?(item)) || (@items << item)
        item.author = self
    end

    def to_json(*_args)
        {
            id: @id,
            first_name: @first_name,
            last_name: @last_name,
            items: @items
        }
    end
end
