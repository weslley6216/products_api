require 'rails_helper'

RSpec.describe ProductSerializer, type: :serializer do
  let(:product) { create(:product, name: 'Notebook', price: 10.99, sku: 'PROD001') }

  subject { described_class.new(product) }

  let(:serialization) { ActiveModelSerializers::Adapter::Attributes.new(subject).as_json }

  describe 'attributes' do
    it 'includes the expected attributes' do
      expect(serialization.keys).to match_array(%i[id name price sku missing_letter])
    end

    it 'serializes the expected attributes' do
      expect(serialization).to eq(
        id: product.id,
        name: 'Notebook',
        price: 10.99,
        sku: 'PROD001',
        missing_letter: 'a',
      )
    end
  end
end
