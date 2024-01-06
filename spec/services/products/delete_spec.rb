require "rails_helper"

RSpec.context 'Services' do
  describe Products::Delete do
    it 'deletes a Product' do
      product = FactoryBot.create(:product)
      params = { id: product.id }

      expect{ described_class.new(params).call }
        .to change{ Product.count }.by(-1)
    end
  end
end
