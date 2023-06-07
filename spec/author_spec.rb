require 'date'
require_relative '../author'

describe Author do
  let(:author) { Author.new('Hermon', 'Gebre') }
  let(:game) { double('game') }

  describe '#initialize' do
    it 'should set an id' do
      expect(author.id).to_not be_nil
    end

    it 'should set the first name' do
      expect(author.first_name).to eq('Hermon')
    end

    it 'should set the last name' do
      expect(author.last_name).to eq('Gebre')
    end

    it 'should set an empty array for items' do
      expect(author.items).to be_empty
    end
  end

  describe '#full_name' do
    it 'should return the full name' do
      expect(author.full_name).to eq('Hermon Gebre')
    end
  end

  def setup
    @item1 = Item.new('Item 1')
    @item2 = Item.new('Item 2')
    @item3 = Item.new('Item 3')
    @item4 = Item.new('Item 4')

    @author.add_item(@item1)
    @author.add_item(@item2)
    @author.add_item(@item3)
    @item2.add_author(author)
    @item4.add_author(author)
  end

  def test_to_hash
    expected_hash = {
      id: 1,
      first_name: 'Hermon',
      last_name: 'Gebre',
      items: [
        { id: 1, name: 'Item 1', authors: [1] },
        { id: 2, name: 'Item 2', authors: [1] },
        { id: 3, name: 'Item 3', authors: [1] },
        { id: 4, name: 'Item 4', authors: [1] }
      ]
    }

    assert_equal(expected_hash, author.to_hash)
  end
end
