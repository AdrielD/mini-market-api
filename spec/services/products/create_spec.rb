require "rails_helper"

RSpec.context 'Services' do
  describe Products::Create do
    let(:category) { FactoryBot.create(:category) }
    let(:params) {
      FactoryBot.attributes_for(:product)
        .merge({ category_id: category.id })
    }

    it 'saves a new Product' do
      expect{ described_class.new(params).call }
        .to change { Product.count }.by(1)
    end

    context 'raises error if' do
      it 'name is empty' do
        no_name = params.except(:name)
        nil_name = params.tap{ |p| p[:name] = nil }
        blank_name = params.tap{ |p| p[:name] = '' }

        [no_name, nil_name, blank_name].each do |params| 
          expect{ described_class.new(params).call }
            .to raise_error(ProductExceptions::NameIsEmpty)
            .and not_change { Product.count }
        end
      end

      it 'category does not exist' do
        invalid_params = params.tap{ |p| p[:category_id] = 99999 }

        expect{ described_class.new(invalid_params).call }
          .to raise_error(ProductExceptions::InexistentCategory)
          .and not_change { Product.count }
      end

      it 'price is invalid' do
        invalid_params = params.tap{ |p| p[:price] = 'asdasd' }

        expect{ described_class.new(invalid_params).call }
          .to raise_error(ProductExceptions::InvalidPrice)
          .and not_change { Product.count }
      end
    end
  end
end
