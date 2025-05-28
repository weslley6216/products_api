require 'rails_helper'

describe 'Products API', type: :request do
  context 'GET /products' do
    context 'when products exist' do
      let!(:notebook) { create(:product, name: 'Notebook', sku: 'SKU001') }
      let!(:keyboard) { create(:product, name: 'Teclado', sku: 'SKU002') }
      let!(:mouse) { create(:product, name: 'Mouse', sku: 'SKU003') }

      it 'returns a success response when there are products' do
        get '/products'

        expect(response).to have_http_status(:ok)
        expect(parsed_response.size).to eq(3)
      end

      it 'returns products ordered by name' do
        get '/products'

        expect(parsed_response[0][:name]).to eq('Mouse')
        expect(parsed_response[1][:name]).to eq('Notebook')
        expect(parsed_response[2][:name]).to eq('Teclado')
      end
    end

    context 'when no products exist' do
      it 'returns a success response when there are no products' do
        get '/products'

        expect(response).to have_http_status(:ok)
        expect(parsed_response).to be_empty
      end
    end
  end

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
