require "rails_helper"

RSpec.context 'Services' do
  describe Categories::Update do
    let(:category) { FactoryBot.create(:category) }

    it 'updates a Category' do
      params = { id: category.id, name: "#{Faker::Commerce.department}, etc" }

      expect{ described_class.new(params).call }
        .to change{ category.reload.name }
        .and change{ category.reload.updated_at }
    end

    context 'raises error if' do
      it 'name is empty' do
        no_name = { id: category.id }
        nil_name = { id: category.id, name: nil }
        blank_name = { id: category.id, name: '' }

        [no_name, nil_name, blank_name].each do |params| 
          expect{ described_class.new(params).call }
            .to raise_error(CategoryExceptions::NameIsEmpty)
            .and not_change{ category.reload.name }
            .and not_change{ category.reload.updated_at }
        end
      end
    end
  end
end
