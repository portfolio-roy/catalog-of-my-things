require './item'
require './music_album'
require 'json'

class MusicAlbumData
  @music_albums = []

  def self.add_music_album(music_album)
    @music_albums << music_album unless @music_albums.include?(music_album)
    store
  end

  def self.store
    json = JSON.pretty_generate(@music_albums.map(&:to_json))
    File.write('music_albums.json', json)
  end

  def self.load
    json = File.read('music_albums.json')
    @music_albums = JSON.parse(json).map do |hash|
      genre = Genre.new(hash['genre']['name'], hash['genre']['items'], id: hash['genre']['id'])
      hash['genre'] = genre
      on_spotify = hash['on_spotify']
      hash.delete('on_spotify')

      MusicAlbum.new(hash, on_spotify)
    end

    @music_albums
  end
end
