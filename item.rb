require 'date'

class Item
  attr_accessor :id, :genre, :author, :source, :label, :publish_date, :archived

  # Use a hash for the parameter
  # Example: hash = {id => 1, genre> "Science", author> "Asif", source> "https://www.google.com", label=> "Science", publish_date=> "2020-01-01", archived=> false}

  def initialize(hash)
    # create a random id using time
    @id = Time.now.to_i
    @genre = hash['genre']
    @author = hash['author']
    @source = hash['source']
    @label = hash['label']
    @publish_date = hash['publish_date']
    @archived = hash['archived']
  end

  def add_genre(genre)
    @genre = genre
  end

  def can_be_archived?
    (Date.today.year - Date.parse(@publish_date).year) > 10
  end

  def move_to_archive
    @archived = can_be_archived?
  end

  def self.list_labels
    labels = ItemData.load('game').map(&:label).uniq
    labels << ItemData.load('music_album').map(&:label).uniq
    labels << ItemData.load('book').map(&:label).uniq

    if labels.empty?
      puts 'There are no labels to list'
    else
      labels.each { |label| puts label }
    end

    nil
  end

  def self.list_sources
    sources = ItemData.load('book').map(&:source).uniq
    sources << ItemData.load('music_album').map(&:source).uniq
    sources << ItemData.load('game').map(&:source).uniq

    if sources.empty?
      puts 'There are no sources to list'
    else
      sources.each { |source| puts source }
    end

    nil
  end
end
