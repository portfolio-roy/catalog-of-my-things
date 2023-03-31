require './item'
require './game'
require 'json'

class GameData
  @games = []

  def self.add_game(game)
    @games << game unless @games.include?(game)
    store
  end

  def self.store
    json = JSON.pretty_generate(@games.map(&:to_json))
    File.write('games.json', json)
  end

  def self.load
    json = File.read('games.json')
    @games = JSON.parse(json).map do |hash|
      genre = Genre.new(hash['genre']['name'], hash['genre']['items'], id: hash['genre']['id'])
      hash['genre'] = genre
      multiplayer = hash['multiplayer']
      last_played_at = hash['last_played_at']
      hash.delete('multiplayer')
      hash.delete('last_played_at')
 
