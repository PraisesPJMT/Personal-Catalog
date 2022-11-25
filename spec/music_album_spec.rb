require_relative '../helper'

describe MusicAlbum do
  context 'Instance of MusicAlbum could be created:' do
    music_album1 = MusicAlbum.new(true, 'Be Me', '2022-11-21')
    music_album2 = MusicAlbum.new(false, 'Wicked Game', '2022-11-21')
    it 'Should be an instance of MusicAlbum' do
      expect(music_album1).to be_an_instance_of MusicAlbum
      expect(music_album2).to be_an_instance_of MusicAlbum
    end
  end

  context 'Instance variables should match arguments for created MusicAlbum:' do
    music_album = MusicAlbum.new(false, "Everything I Don't Say", '2022-11-21')
    it 'Name attribute should match MusicAlbum name argument' do
      expect(music_album.name).to eq "Everything I Don't Say"
    end

    it '@on_spotify attribute should match MusicAlbum on_spotify argument' do
      expect(music_album.on_spotify).to eq false
    end

    it '@publish_date attribute should match MusicAlbum publish_date argument' do
      expect(music_album.publish_date).to eq '2022-11-21'
    end
  end

  context 'MusicAlbum instance could be created without optional arguments:' do
    music_album = MusicAlbum.new(false, 'Healing', '2022-11-21')
    it 'Created MusicAlbum instance without id should have id automatically generated' do
      expect(music_album.id).to be_an_integer
    end

    it '@archived attribute should be set to false as default' do
      expect(music_album.archived).to eq false
    end
  end

  context 'Instance variables should reflect private or public status:' do
    music_album = MusicAlbum.new(true, 'The Search', '2022-11-21')
    it 'Name variable of MusicAlbum instance should be mutable' do
      music_album.name = 'Inception'
      expect(music_album.name).to eq 'Inception'
      music_album.name = 'Deception'
      expect(music_album.name).to eq 'Deception'
    end

    it '@on_spotify variable of MusicAlbum instance should be mutable' do
      music_album.on_spotify = false
      expect(music_album.on_spotify).to eq false
      music_album.on_spotify = true
      expect(music_album.on_spotify).to eq true
    end

    it '@publish_date variable of MusicAlbum instance should be mutable' do
      music_album.publish_date = '2022-11-21'
      expect(music_album.publish_date).to eq '2022-11-21'
      music_album.publish_date = '2022-11-27'
      expect(music_album.publish_date).to eq '2022-11-27'
    end

    it 'Changing @id variable of MusicAlbum instance should raise and NoMethodError error' do
      expect { music_album.id = 12 }.to raise_error NoMethodError
      expect { music_album.id = 678 }.to raise_error NoMethodError
    end
  end

  context 'Methods of MusicAlbum instance should reflect private or public status:' do
    music_album = MusicAlbum.new(false, 'Wide Eye', '2022-11-21')
    it '#move_to_archive method of MusicAlbum instance should be accessible' do
      music_album.move_to_archive
      expect(music_album.archived).to eq false
    end

    it 'Accessing #can_be_archived? method of MusicAlbum instance should raise and NoMethodError error' do
      expect { music_album.can_be_archived? }.to raise_error NoMethodError
      music_album.publish_date = '2012-02-16'
      expect { music_album.can_be_archived? }.to raise_error NoMethodError
    end
  end

  context 'When associates are assign to instance of MusicAlbum:' do
    music_album = MusicAlbum.new(false, 'Let Me Go', '2022-11-21')
    it 'Instance of Genre should could be assign to instance of MusicAlbum' do
      hip_up_genre = Genre.new('HipPop')
      music_album.genre = hip_up_genre
      expect(hip_up_genre.items.include?(music_album)).to eq true
      rock_genre = Genre.new('Rock & Roll')
      music_album.genre = rock_genre
      expect(rock_genre.items.include?(music_album)).to eq true
    end

    it 'Instance of Label should could be assign to instance of MusicAlbum' do
      red_label = Label.new('Roses', 'Rose red')
      music_album.label = red_label
      expect(red_label.items.include?(music_album)).to eq true
      sky_label = Label.new('Sky', 'Sky blue')
      music_album.label = sky_label
      expect(sky_label.items.include?(music_album)).to eq true
    end

    it 'Instance of Author should could be assign to instance of MusicAlbum' do
      author1 = Author.new('Praises', 'Tula')
      music_album.author = author1
      expect(author1.items.include?(music_album)).to eq true
      author2 = Author.new('Shaquille', 'Ndunda')
      music_album.author = author2
      expect(author2.items.include?(music_album)).to eq true
    end
  end
end
