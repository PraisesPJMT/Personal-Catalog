require_relative '../helper'

describe Genre do
  context 'Instance of Genre could be created:' do
    test_genre1 = Genre.new('Pop')
    test_genre2 = Genre.new('Instrumentals')
    it 'Should be an instance of Genre' do
      expect(test_genre1).to be_an_instance_of Genre
      expect(test_genre2).to be_an_instance_of Genre
    end
  end

  context 'Instance variables should match arguments for created Genre:' do
    test_genre = Genre.new('Pop')
    it 'Name instance variable should match Genre name argument' do
      expect(test_genre.name).to eq 'Pop'
    end
  end

  context 'Genre instance could be created without optional arguments:' do
    test_genre = Genre.new('Blues')
    it 'Created Genre instance without id should have id automatically generated' do
      expect(test_genre.id).to be_an_integer
    end
  end

  context 'Instance variables should reflect private or public status:' do
    test_genre = Genre.new('R & B')
    it 'Name variable of Genre instance should be mutable' do
      test_genre.name = 'Soul'
      expect(test_genre.name).to eq 'Soul'
      test_genre.name = 'Gospel'
      expect(test_genre.name).to eq 'Gospel'
    end

    it 'Changing @id variable of Genre instance should raise and NoMethodError error' do
      expect { test_genre.id = 12 }.to raise_error(NoMethodError)
      expect { test_genre.id = 678 }.to raise_error(NoMethodError)
    end
  end

  context 'When items are added to instance of Genre:' do
    test_genre = Genre.new('Rap')
    it 'Items count for instance of Genre should be zero(0) on initialization' do
      expect(test_genre.items.length).to eq 0
    end

    it 'Addition of item to instance of Genre should be possible' do
      test_genre.add_item(Item.new('2022-11-20'))
      expect(test_genre.items.length).to eq 1
    end

    it 'Addition of more than 1 item to instance of Genre should be possible' do
      test_genre.add_item(Item.new('2022-11-21'))
      expect(test_genre.items.length).to eq 2
      test_genre.add_item(Item.new('2022-11-22'))
      expect(test_genre.items.length).to eq 3
    end
  end
end
