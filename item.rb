require 'date'

class Item
  attr_accessor :id, :genre, :author, :source, :label, :publish_date, :archived

  # Use a hash for the parameter
  # Example: hash = {id => 1, genre> "Science", author> "Asif", source> "https://www.google.com", label=> "Science", publish_date=> "2020-01-01", archived=> false}

  def initialize(hash)
    # create a random id using time
    @id = hash['id'] || Time.now.to_i
    @genre = hash['genre'] || nil
    @author = hash['author'] || nil
    @source = hash['source'] || nil
    @label = hash['label'] || nil
    @publish_date = hash['publish_date'] || nil
    @archived = hash['archived'] || false
  end

  def add_genre(genre)
    @genre = genre
  end

  def can_be_archived?
    (Time.now.year - @publish_date.year) > 10
  end

  def move_to_archive
    @archived = can_be_archived?
  end
end
