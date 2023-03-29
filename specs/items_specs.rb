#unit tests for Items class

require './item'
require './genre'

describe Item do
    let (:genre) { Genre.new('Science', []) }
    let (:dictionary) { hash = { 'genre' => genre,
        'author' => 'Asif',
        'source' => 'https://www.google.com',
        'label' => 'Physics 101',
        'publish_date' => Date.new(2020, 1, 1),
        'archived' => false } }
    let (:item) { Item.new(dictionary) }
    
    context 'when initialized' do
        it 'should have an empty array of items' do
            expect(item.label).to eq('Science') 
        end

        it 'should have an id' do
            expect(item.id).to eq(Time.now.to_i)
        end

        it 'should have a genre' do
            expect(item.genre).to eq(genre)
        end

        it 'should have an author' do
            expect(item.author).to eq('Asif')
        end

        it 'should have a source' do
            expect(item.source).to eq('https://www.google.com')
        end

        it 'should have a label' do
            expect(item.label).to eq('Physics 101')
        end

        it 'should have a publish_date' do
            expect(item.publish_date).to eq(Date.new(2020, 1, 1))
        end

        it 'should have a archived' do
            expect(item.archived).to eq(false)
        end

        it 'should have a can_be_archived?' do
            expect(item.can_be_archived?).to eq(false)
        end
    end

    context 'when we use add_genre' do
        it 'should add a genre' do
            new_genre = Genre.new('Mathematics', [])
            item.add_genre(new_genre)
            
            expect(item.genre).to eq(new_genre)
        end
    end

end