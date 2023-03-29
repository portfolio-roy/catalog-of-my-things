require_relative '../book'

describe 'Unit testing for Book class' do
  before :each do
    @book = Book.new('Oxford University Press', 'good')
  end

  context 'initialize object' do
    it 'should be an instance of Book' do
      expect(@book).to be_instance_of Book
    end

    it 'should not be an instance of Item' do
      expect(@book).not_to be_instance_of Item
    end

    it 'should be a kind of Item' do
      expect(@book).to be_kind_of Item
    end
  end

  context 'Publisher name' do
    it 'should be "Oxford University Pres"' do
      expect(@book.publisher).to eql 'Oxford University Press'
    end
  end

  context 'Cover state' do
    it 'should be "good"' do
      expect(@book.cover_state).to eql 'good'
    end
  end
end
