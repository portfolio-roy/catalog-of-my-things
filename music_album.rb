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
end
