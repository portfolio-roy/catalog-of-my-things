require './item'

class MusicAlbum < Item
  attr_accessor :on_spotify

  def initialize(dictionary, on_spotify)
    super(dictionary)
    @on_spotify = on_spotify
  end
end
