require_relative './item'

class Game < Item
  attr_accessor :multiplayer, :last_played_at
  attr_reader :id

  def initialize(multiplayer, last_played_at, dictionary)
    super(dictionary)
    @multiplayer = multiplayer
    @last_played_at = last_played_at
    @archived = can_be_archived?
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
      multiplayer: @multiplayer,
      last_played_at: @last_played_at

    }
  end

  def to_s
    "Game: #{@id} - #{@label} - By #{@author} - #{@genre.name}"
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
      'archived' => get_bool_input('archived'),
      'publisher' => get_input('publisher')
    }
    multiplayer = get_bool_input('multiplayer')
    last_played_at = get_input('last played date')

    Game.new(multiplayer, last_played_at, dictionary)
  end

  def self.get_input(prompt)
    puts "Enter the #{prompt}"
    gets.chomp
  end

  def self.get_bool_input(prompt)
    puts "Enter the #{prompt} (true/false)"
    gets.chomp == 'true'
  end

  private

  def can_be_archived?
    @archived = if super || Date.today - Date.parse(@last_played_at) > 365 * 2
                  true
                else
                  false
                end
  end
end
