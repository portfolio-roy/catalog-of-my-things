require './item'
require './get_inputs'

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
    get_inputs('music')
  end

  def can_be_archived?
    super || @on_spotify ? true : false
  end

  def self.list_genres
    albums = ItemData.load('music_album')

    if (genres = albums.map(&:genre).uniq).empty?
      puts 'There are no genres to list'
    else
      genres.each { |genre| puts genre }
    end
    nil
  end

  def self.get_input(prompt)
    puts "Enter the #{prompt}"
    gets.chomp
  end

  def self.get_bool_input(prompt)
    puts "Enter the #{prompt} (true/false)"
    gets.chomp
  end
end
