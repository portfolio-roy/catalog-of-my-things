require_relative '../author'

describe 'Unit testing for Author Class' do
  before :each do
    @author = Author.new('Oluwatoyin', 'Olaoye')
  end

  context 'initialize object' do
    it 'should be an instance of Author' do
      expect(@author).to be_instance_of Author
    end

    it 'should not be an instance of Item' do
      expect(@author).not_to be_instance_of Item
    end

    
