require_relative '../helper'

describe Game do
  before :each do
    @game = Game.new 'Devil May Cry', 2, '2019-03-09', '2015-05-15'
  end

  describe '#new' do
    it 'returns a new instance of Game object' do
      expect(@game).to be_an_instance_of Game
    end
  end

  describe '#multiplayer' do
    it 'returns the correct number of players' do
      expect(@game.multiplayer).to eql 2
    end
  end

  describe '#last_played_at' do
    it 'returns the correct date game was last played' do
      expect(@game.last_played_at).to eql '2019-03-09'
    end
  end

  describe '#publish_date' do
    it 'returns the correct game publish date' do
      expect(@game.publish_date).to eql '2015-05-15'
    end
  end

  it 'tests the private method directly' do
    expect(@game.send(:can_be_archived?)).to eql false
  end
end
