require_relative '../book'

describe Book do
  before(:each) do
    @book = Book.new('Mega Publisher', 'Bad', '2000/01/01')
  end

  describe '#new' do
    it 'Should create a new book object' do
      expect(@book).to be_an_instance_of Book
    end
  end

  describe '#Item_kind' do
    it 'Should be a kind of Item' do
      expect(@book).to be_kind_of Item
    end
  end

  context 'when Book object created' do
    it 'Should return the publisher to be The Review and Herald' do
      expect(@book.publisher).to eq 'Mega Publisher'
    end

    it 'Should return the cover state to be Bad' do
      expect(@book.cover_state).to eq 'Bad'
    end

    it 'Should return the publish date to be 2000/01/01' do
      expect(@book.publish_date).to eq '2000/01/01'
    end
  end

  describe '#can_be_archived?' do
    context 'when the book is archived and the cover state is not "bad"' do
      before do
        @book = Book.new('Mega Publisher', 'Good', '2000/01/01')
      end

      it 'returns true' do
        puts @book.inspect
        expect(@book.archived).to be true
      end
    end

    context 'when the book is not archived and the cover state is not "bad"' do
      before do
        @book = Book.new('Mega Publisher', 'Good', '2020/01/01')
      end

      it 'returns false' do
        expect(@book.archived).to be false
      end
    end
  end
end
