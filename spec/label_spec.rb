require_relative '../label'

describe 'Unit Tests for Label Class' do
  before :each do
    @label = Label.new('MyTitle', 'Purple')
  end

  context 'initialize object' do
    it 'should be an instance of Label' do
      expect(@label).to be_instance_of Label
    end

    it 'should not be an instance of Item' do
      expect(@label).not_to be_instance_of Item
    end

    it 'should be a kind of Item' do
      expect(@label).to be_kind_of Item
    end
  end

  context 'title' do
    it 'should be "MyTitle"' do
      expect(@label.title).to eql 'MyTitle'
    end
  end

  context 'color' do
    it 'should be "Purple"' do
      expect(@label.color).to eql 'Purple'
    end
  end
end
