require "rails_helper"

RSpec.context 'Services' do
  describe Products::Update do
    let(:product) { FactoryBot.create(:product) }

    it 'updates a Product' do
      new_category = FactoryBot.create(:category)

      params = {
        id: product.id,
        name: 'Test Product',
        description: 'This is nice!',
        price: 123.45,
        category_id: new_category.id
      }

      expect{ described_class.new(params).call }
        .to change { product.reload.name }
        .and change { product.reload.description }
        .and change { product.reload.price }
        .and change { product.reload.category_id }
    end

    context 'raises error if' do
      it 'name is empty' do
        no_name = product.attributes.except(:name)
        nil_name = product.attributes.tap{ |p| p[:name] = nil }
        blank_name = product.attributes.tap{ |p| p[:name] = '' }

        [no_name, nil_name, blank_name].each do |params| 
          expect{ described_class.new(params).call }
            .to raise_error(ProductExceptions::NameIsEmpty)
            .and not_change { product.reload.name }
        end
      end

      it 'category does not exist' do
        invalid_params = {
          id: product.id,
          name: product.name,
          description: product.description,
          price: product.price,
          category_id: 999999
        }

        expect{ described_class.new(invalid_params).call }
          .to raise_error(ProductExceptions::InexistentCategory)
          .and not_change { product.reload.price }
      end

      it 'price is invalid' do
        invalid_params = {
          id: product.id,
          name: product.name,
          description: product.description,
          price: 'abc',
          category_id: product.category_id
        }

        expect{ described_class.new(invalid_params).call }
          .to raise_error(ProductExceptions::InvalidPrice)
          .and not_change { Product.count }
      end
    end
  end
end
