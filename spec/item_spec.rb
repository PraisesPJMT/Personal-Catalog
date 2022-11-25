require_relative '../helper'

describe Item do
  context 'Instance of Item could be created:' do
    test_item1 = Item.new('2022-11-21')
    test_item2 = Item.new('2007-04-16')
    it 'Should be an instance of Item' do
      expect(test_item1).to be_an_instance_of Item
      expect(test_item2).to be_an_instance_of Item
    end
  end

  context 'Instance variables should match arguments for created Item:' do
    test_item = Item.new('2022-11-21', 25, archived: true)
    it 'Id attribute should match Item id argument' do
      expect(test_item.id).to eq 25
    end

    it '@publish_date attribute should match Item publish_date argument' do
      expect(test_item.publish_date).to eq '2022-11-21'
    end

    it '@archived attribute should match Item archived argument' do
      expect(test_item.archived).to eq true
    end
  end

  context 'Item instance could be created without optional arguments:' do
    test_item = Item.new('2022-11-21')
    it 'Created Item instance without id should have id automatically generated' do
      expect(test_item.id).to be_an_integer
    end

    it '@archived attribute should be set to false as default' do
      expect(test_item.archived).to eq false
    end
  end

  context 'Instance variables should reflect private or public status:' do
    test_item = Item.new('2022-11-21', 6)
    it '@publish_date variable of Item instance should be mutable' do
      test_item.publish_date = '2003-07-15'
      expect(test_item.publish_date).to eq '2003-07-15'
      test_item.publish_date = '2014-12-31'
      expect(test_item.publish_date).to eq '2014-12-31'
    end

    it 'Changing @id variable of Item instance should raise and NoMethodError error' do
      expect { test_item.id = 12 }.to raise_error
      expect { test_item.id = 678 }.to raise_error
    end

    it 'Changing @archived variable of Item instance should raise and NoMethodError error' do
      expect { test_item.archived = false }.to raise_error
      expect { test_item.archived = true }.to raise_error
    end
  end

  context 'Methods of Item instance should reflect private or public status:' do
    test_item = Item.new('2022-11-21')
    it '#move_to_archive method of Item instance should be accessible' do
      test_item.move_to_archive
      expect(test_item.archived).to eq false
    end

    it 'Accessing #can_be_archived? method of Item instance should raise and NoMethodError error' do
      expect { test_item.can_be_archived? }.to raise_error
      test_item.publish_date = '2012-02-16'
      expect { test_item.can_be_archived? }.to raise_error
    end
  end

  context 'When associates are assign to instance of Item:' do
    test_item = Item.new('2022-11-21')
    it 'Instance of Genre should could be assign to instance of Item' do
      hip_up_genre = Genre.new('HipPop')
      test_item.genre = hip_up_genre
      expect(hip_up_genre.items.include?(test_item)).to eq true
      rock_genre = Genre.new('Rock & Roll')
      test_item.genre = rock_genre
      expect(rock_genre.items.include?(test_item)).to eq true
    end

    it 'Instance of Label should could be assign to instance of Item' do
      red_label = Label.new('Roses', 'Rose red')
      test_item.label = red_label
      expect(red_label.items.include?(test_item)).to eq true
      sky_label = Label.new('Sky', 'Sky blue')
      test_item.label = sky_label
      expect(sky_label.items.include?(test_item)).to eq true
    end

    it 'Instance of Author should could be assign to instance of Item' do
      author1 = Author.new('Praises', 'Tula')
      test_item.author = author1
      expect(author1.items.include?(test_item)).to eq true
      author2 = Author.new('Shaquille', 'Ndunda')
      test_item.author = author2
      expect(author2.items.include?(test_item)).to eq true
    end
  end
end
