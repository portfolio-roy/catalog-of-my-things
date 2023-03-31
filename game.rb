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
    puts 'Enter the name of the author'
    author = gets.chomp

    puts 'Enter the source'
    source = gets.chomp

    puts 'Enter the label'
    label = gets.chomp

    puts 'Enter the publish date'
    publish_date = gets.chomp

    puts 'Enter the archived status'
    archived = gets.chomp == 'true'

    puts 'Enter the publisher'
    publisher = gets.chomp

    puts 'Enter the multiplayer status'
    multiplayer = gets.chomp == 'true'

    puts 'Enter the last played date'
    last_played_at = gets.chomp

    dictionary = { 'genre' => genre, 'author' => author, 'source' => source,
                   'label' => label,
                   'publish_date' => publish_date,
                   'archived' => archived }

    Game.new(multiplayer, last_played_at, dictionary)
  end

  private

  def can_be_archived?
    @archived = if super || Date.today - Date.parse(@last_played_at) > 365 * 2
                  true
                else
                  false
                end
  
