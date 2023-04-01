require_relative 'item'
require_relative './get_inputs'
class Book < Item
  attr_accessor :publisher, :cover_state
  attr_reader :id

  def initialize(publisher, cover_state, dictionary)
    super(dictionary)
    @publisher = publisher
    @cover_state = cover_state
  end

  def to_json(*_args)
    {
      id: @id,
      genre: @genre.to_json,
      author: @author,
      source: @source,
      label: @label,
      publish_date: @publish_date,
      archived: @archived,
      publisher: @publisher,
      cover_state: @cover_state
    }
  end

  def to_s
    "Book: #{@id} - #{@label} - By #{@author} - #{@genre.name}"
  end

  def self.create_from_ui
    get_inputs('book')
  end

  def self.list_authors
    authors = ItemData.load('book').map(&:author).uniq

    if authors.empty?
      puts 'There are no genres to list'
    else
      authors.each { |author| puts author }
    end

    nil
  end

  private

  def can_be_archived?
    @archived = if super or @cover_state == 'bad'
                  true
                else
                  false
                end
  end
end
