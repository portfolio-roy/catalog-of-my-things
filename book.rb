require_relative 'item'

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
    puts 'Enter the name of the genre'
    genre_name = gets.chomp
    genre = Genre.new(genre_name, [])

    dictionary = {
      'genre' => genre,
      'author' => get_input('author'),
      'source' => get_input('source'),
      'label' => get_input('label'),
      'publish_date' => get_input('publish date'),
      'archived' => get_bool_input('archived')
    }
    publisher = get_input('publisher')
    cover_state = get_input('cover state')

    Book.new(publisher, cover_state, dictionary)
  end

  def self.get_input(prompt)
    puts "Enter the #{prompt}"
    gets.chomp
  end

  def self.get_bool_input(prompt)
    puts "Enter the #{prompt} (true/false)"
    gets.chomp
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
