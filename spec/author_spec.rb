require_relative '../helper'

describe Author do
  before :each do
    @author = Author.new 'Jimmy', 'Cruxland'
  end

  describe '#new' do
    it 'returns a new instance of Author object' do
      @author.should be_an_instance_of Author
    end

    it 'throws an ArgumentError when given fewer than 2 parameters' do
      expect { Author.new('Shaq') }.to raise_exception ArgumentError
    end
  end

  describe '#first_name' do
    it 'returns the correct first name' do
      @author.first_name.should eql 'Jimmy'
    end
  end

  describe '#last_name' do
    it 'returns the correct last name' do
      @author.last_name.should eql 'Cruxland'
    end
  end

  describe '#add_items' do
    it 'adds a new item to the author' do
      game = Game.new 'God of War', 2, '2019-03-09', '2015-05-15'
      @author.add_item game
      @author.items.should include game
    end
  end
end
