# specs for genre class

require './genre'
require './item'

describe Genre do
  let(:genre) { Genre.new('Hip Hop', []) }

  # check initialization
  # check that it is an instance of Genre
  describe 'Initialization' do
    it 'is an instance of the Genre class' do
      expect(genre).to be_instance_of(Genre)
    end
  end

  # check getters and setters
  describe 'Accessors' do
    it 'should be able to get and set name' do
      expect(genre.name).to eq('Hip Hop')
    end
  end

  describe 'Methods' do
    it 'should be able to add item' do
      expect(genre.items).to eq([])
    end

    it 'should be able to add item' do
      item = Item.new({ 'genre' => genre })

      genre.add_item(item)
      expect(genre.items).to eq([item])
    end

    it 'should be able to add item without duplicating' do
      item = Item.new({ 'genre' => genre })
      genre.add_item(item)
      genre.add_item(item)
      expect(genre.items.length).to eq(1)
    end
  end
end
