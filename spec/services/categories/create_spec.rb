require "rails_helper"

RSpec.context 'Services' do
  describe Categories::Create do
    let(:category_params) { FactoryBot.attributes_for(:category) }

    it 'saves a new Category' do
      expect(Category.count).to eq 0
      described_class.new(category_params).call
      expect(Category.count).to eq 1
    end

    context 'raises error if' do
      it 'name is empty' do
        expect{ described_class.new({}).call }.to raise_error(CategoryExceptions::NameIsEmpty)
        expect{ described_class.new({ name: '' }).call }.to raise_error(CategoryExceptions::NameIsEmpty)
        expect(Category.count).to eq 0
      end
    end
  end
end
