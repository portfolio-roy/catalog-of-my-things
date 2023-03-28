require 'date'

class Item
  attr_accessor :id, :genre, :author, :source, :label, :publish_date, :archived

  def initialize(id, genre, author, source, label, publish_date, archived)
    @id = id
    @genre = genre
    @author = author
    @source = source
    @label = label
    @publish_date = publish_date
    @archived = archived
  end

  def can_be_archived?
    (Time.now.year - @publish_date.year) > 10
  end

  # Asif: add your code here
  # define Methode move_to_archive
  # logic: @archived = can_be_archived?
end
