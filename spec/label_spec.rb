require_relative '../label'
require_relative '../item'

describe Label do
  before(:each) do
    @label = Label.new('Gift', 'Pink')
  end

  describe '#new' do
    it 'Should create a new Label object' do
      expect(@label).to be_an_instance_of Label
    end
  end

  context 'when Label object created' do
    it 'Should return the title to be Gift' do
      expect(@label.title).to eq 'Gift'
    end

    it 'Should return the color to be Pink' do
      expect(@label.color).to eq 'Pink'
    end
  end
end
