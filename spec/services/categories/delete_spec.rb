require "rails_helper"

RSpec.context 'Services' do
  describe Categories::Delete do
    it 'deletes a Category' do
      category = FactoryBot.create(:category)
      params = { id: category.id }

      expect{ described_class.new(params).call }
        .to change{ Category.count }.by(-1)
    end

    context 'raises error if' do
      it 'category has associated Products' do
        product = FactoryBot.create(:product)
        category = product.category

        expect{ described_class.new(id: category.id).call }
          .to raise_error(CategoryExceptions::CategoryNotEmpty)
          .and not_change{ Category.count }
      end
    end
  end
end
