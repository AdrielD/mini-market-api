require "rails_helper"

RSpec.context 'Services' do
  describe Categories::Create do
    let(:params) { FactoryBot.attributes_for(:category) }

    it 'saves a new Category' do
      expect{ described_class.new(params).call }
        .to change { Category.count }.by(1)
    end

    context 'raises error if' do
      it 'name is empty' do
        no_name = {}
        nil_name = { name: nil }
        blank_name = { name: '' }

        [no_name, nil_name, blank_name].each do |params| 
          expect{ described_class.new(params).call }
            .to raise_error(CategoryExceptions::NameIsEmpty)
            .and not_change { Category.count }
        end
      end

      it 'category with provided name already exists' do
        Category.create(params)

        expect{ described_class.new(params).call }
          .to raise_error(CategoryExceptions::NameAlreadyExists)
          .and not_change { Category.count }
      end
    end
  end
end
