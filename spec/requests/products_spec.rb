require 'rails_helper'

describe 'Products API', type: :request do
  describe 'POST /products' do
    context 'with valid parameters' do
      let(:valid_attributes) { { product: { name: 'Notebook', price: 1500.00, sku: 'NOTEBOOK001' } } }

      it 'creates a new product' do
        expect {
          post '/products', params: valid_attributes
        }.to change(Product, :count).by(1)

        expect(response).to have_http_status(201)
        expect(parsed_response[:id]).to be_present
        expect(parsed_response[:name]).to eq('Notebook')
        expect(parsed_response[:price]).to eq('1500.0')
        expect(parsed_response[:sku]).to eq('NOTEBOOK001')
      end
    end

    context 'with invalid parameters' do
      let(:invalid_attributes) { { product: { name: nil } } }

      it 'does not create a new product' do
        post('/products', params: invalid_attributes)

        expect(response).to have_http_status(422)
        expect(parsed_response).to include(name: ["can't be blank"])
        expect(parsed_response).to include(price: ["can't be blank", "is not a number"])
        expect(parsed_response).to include(sku: ["can't be blank"])
      end
    end
  end
end
