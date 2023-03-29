require './item'

class MusicAlbum < Item
  attr_accessor :on_spotify

  def initialize(dictionary, on_spotify)
    super(dictionary)
    @on_spotify = on_spotify
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
      on_spotify: @on_spotify
    }
  end

  def to_s
    "MusicAlbum: #{@id} - #{@label} - By #{@author} - #{@genre.name}"
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

    puts 'Enter the spotify status'
    on_spotify = gets.chomp == 'true'

    dictionary = { 'genre' => genre, 'author' => author, 'source' => source,
                   'label' => label, 'publish_date' => Date.parse(publish_date), 'archived' => archived }

    MusicAlbum.new(dictionary, on_spotify)
  end
end
