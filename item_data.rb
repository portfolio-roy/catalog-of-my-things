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
            store(item_type)
        elsif item_type == 'game'
            @games << item unless @games.include?(item)
            store(item_type)
        else
            @music_albums << item unless @music_albums.include?(item)
            store(item_type)
        end
    end
    
    def self.store(item_type)
        if item_type == 'book'
            json = JSON.pretty_generate(@books.map(&:to_json))
            File.write('books.json', json)
        elsif item_type == 'game'
            json = JSON.pretty_generate(@games.map(&:to_json))
            File.write('games.json', json)
        else
            json = JSON.pretty_generate(@music_albums.map(&:to_json))
            File.write('music_albums.json', json)
        end
    end
    
    def self.load(item_type)
        if item_type == 'book'
            json = File.read('books.json')
            @books = JSON.parse(json).map do |hash|
                genre = Genre.new(hash['genre']['name'], hash['genre']['items'], id: hash['genre']['id'])
                hash['genre'] = genre
                cover_state = hash['cover_state']
                publisher = hash['publisher']
                hash.delete('archived')
                Book.new(publisher, cover_state, hash)
            end
            @books
        elsif item_type == 'game'
            json = File.read('games.json')
            @games = JSON.parse(json).map do |hash|
                genre = Genre.new(hash['genre']['name'], hash['genre']['items'], id: hash['genre']['id'])
                hash['genre'] = genre
                multiplayer = hash['multiplayer']
                last_played_at = hash['last_played_at']
                hash.delete('multiplayer')
                hash.delete('last_played_at')
                Game.new(multiplayer, last_played_at, hash)
            end
            @games
        else
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
end

