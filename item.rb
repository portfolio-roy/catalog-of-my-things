require 'date'

class Item
  attr_accessor :id, :genre, :author, :source, :label, :publish_date, :archived

  def initialize(dictionary)
    @id = dictionary.id || Time.now.to_i
    @genre = dictionary.genre
    @author = dictionary.author
    @source = dictionary.source
    @label = dictionary.label
    @publish_date = dictionary.publish_date
    @archived = dictionary.archived
  end

  def can_be_archived?
    (Time.now.year - @publish_date.year) > 10
  end

  def add_genre(genre)
    @genre = genre
  end

  # Asif: add your code here
  # define Methode move_to_archive
  # logic: @archived = can_be_archived?
end
