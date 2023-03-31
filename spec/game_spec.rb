require_relative '../game'

describe 'Unit testing for Game Class' do
  before :each do
    hash = { 'publish_date' => '2010/02/05' }
    @game = Game.new('Y', '1994/08/01', hash)
  end

  context 'initialize object' do
    it 'is an instance of Game' do
      expect(@game).to be_instance_of Game
    end

    it 'is not an instance of Item' do
      expect(@game).not_to be_instance_of Item
    end

   
