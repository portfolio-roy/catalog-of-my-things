require './item.rb'

class MusicAlbum < Item
    attr_accessor :on_spotify
    
    def initialize(on_spotify)
        @on_spotify = on_spotify
    end
end