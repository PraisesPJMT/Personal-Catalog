require_relative '../book'

describe 'Unit Tests for Book Class' do
  before :each do
    @book = Book.new('MyPublisher', 'bad', '1991/05/21')
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

  context 'book publisher' do
    it 'should be "MyPublisher"' do
      expect(@book.publisher).to eql 'MyPublisher'
    end
  end

  context 'book cover state' do
    it 'should be "bad"' do
      expect(@book.cover_state).to eql 'bad'
    end
  end
end
