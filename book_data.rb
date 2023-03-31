require './item'
require './book'
require 'json'

class BookData
  @books = []
  def self.add_book(book)
    @books << book unless @books.include?(book)
    store
  end

  def self.store
    json = JSON.pretty_generate(@books.map(&:to_json))
    File.write('books.json', json)
  end

  def self.load
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
  end
end
