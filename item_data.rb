require './item'
require './game'
require './book'
require './music_album'
require 'json'

class ItemData
  @books = []
  @games = []
  @music_albums = []

  def self.add_item(item_type, item)
    if item_type == 'book'
      @books << item unless @books.include?(item)
    elsif item_type == 'game'
      @games << item unless @games.include?(item)
    else
      @music_albums << item unless @music_albums.include?(item)
    end
    store(item_type)
  end

  def self.store(item_type)
    case item_type
    when 'book'
      json = JSON.pretty_generate(@books.map(&:to_json))
      File.write('books.json', json)
    when 'game'
      json = JSON.pretty_generate(@games.map(&:to_json))
      File.write('games.json', json)
    else
      json = JSON.pretty_generate(@music_albums.map(&:to_json))
      File.write('music_albums.json', json)
    end
  end

  def self.load(item_type)
    filename = "#{item_type}s.json"
    json = File.read(filename)
    instance_variable_set("@#{item_type}s", JSON.parse(json).map do |hash|
      genre = Genre.new(hash['genre']['name'], hash['genre']['items'], id: hash['genre']['id'])
      hash['genre'] = genre
      case item_type
      when 'book'
        Book.new(hash.delete('publisher'), hash.delete('cover_state'), hash)
      when 'game'
        Game.new(hash.delete('multiplayer'), hash.delete('last_played_at'), hash)
      else
        MusicAlbum.new(hash, hash.delete('on_spotify'))
      end
    end)
  end
end
