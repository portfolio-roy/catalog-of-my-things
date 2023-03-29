# specs for MusicAlbum class

require './music_album'
require './genre'

describe MusicAlbum do
  let(:genre) { Genre.new('Hip Hop', []) }
  let(:dictionary) do
    { 'genre' => genre,
      'author' => 'The Beatles',
      'source' => 'https://www.google.com',
      'label' => 'Music',
      'publish_date' => Date.new(2020, 1, 1),
      'archived' => false }
  end
  let(:music_album) { MusicAlbum.new(dictionary, true) }

  # check initialization
  # check that it is an instance of MusicAlbum
  describe 'Initialization' do
    it 'is an instance of the MusicAlbum class' do
      expect(music_album).to be_instance_of(MusicAlbum)
    end

    # check that it is an extended from Item
    it 'is an extended from Item class' do
      expect(music_album).to be_kind_of(Item)
    end

    # check that it is an instance of Item
    it 'is not instance of the Item class' do
      # not an instance of Item
      expect(music_album).to_not be_instance_of(Item)
    end
  end

  # check getters and setters
  describe 'Accessors' do
    it 'should be able to get and set name' do
      expect(music_album.author).to eq('The Beatles')
    end

    it 'should be able to get and set genre' do
      expect(music_album.genre).to eq(genre)
    end
  end
end
