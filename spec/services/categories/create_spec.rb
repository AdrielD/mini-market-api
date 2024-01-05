require "rails_helper"

RSpec.context 'Services' do
  describe Categories::Create do
    let(:category_params) { FactoryBot.attributes_for(:category) }

    it 'saves a new Category' do
      expect{ described_class.new(category_params).call }
        .to change { Category.count }.by(1)
    end

    context 'raises error if' do
      it 'name is empty' do
        [{}, { name: '' }].each do |params| 
          expect{ described_class.new(params).call }
            .to raise_error(CategoryExceptions::NameIsEmpty)
            .and change { Category.count }.by(0)
        end
      end

      it 'category with provided name already exists' do
        Category.create(category_params)

        expect{ described_class.new(category_params).call }
          .to raise_error(CategoryExceptions::NameAlreadyExists)
          .and change { Category.count }.by(0)
      end
    end
  end
end
