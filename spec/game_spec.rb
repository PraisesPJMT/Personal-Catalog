require_relative '../game'

describe Game do
  before :each do
    @game = Game.new 'Devil May Cry', 2, '2019-03-09', '2015-05-15'
  end

  describe '#new' do
    it 'returns a new instance of Game object' do
      @game.should be_an_instance_of Game
    end
  end

  describe '#multiplayer' do
    it 'returns the correct number of players' do
      @game.multiplayer.should eql 2
    end
  end

  describe '#last_played_at' do
    it 'returns the correct date game was last played' do
      @game.last_played_at.should eql '2019-03-09'
    end
  end

  describe '#publish_date' do
    it 'returns the correct game publish date' do
      @game.publish_date.should eql '2015-05-15'
    end
  end

  it 'tests the private method directly' do
    @game.send(:can_be_archived?).should eql false
  end
end
