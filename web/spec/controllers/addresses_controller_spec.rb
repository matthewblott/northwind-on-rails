require 'rails_helper'

describe AddressesController, type: :controller do
  describe 'GET #search' do
    let(:employee) { FactoryBot.create(:employee) } 
    let!(:address_1) { FactoryBot.create(:address, name: '123 Main St') }
    let!(:address_2) { FactoryBot.create(:address, name: '456 Oak Ave') }

    before do
      sign_in employee
    end

    context 'when there is a query' do
      it 'returns matching addresses' do
        get :search, params: { q: 'Main' }, format: :turbo_stream
        items = assigns(:items)
        expect(items.values).to include('123 Main St')
        expect(items.values).to include('456 Oak Ave')
        expect(response).to render_template(partial: '_search_results')
      end

      it 'returns no addresses if none match' do
        get :search, params: { q: 'Pine' }, format: :turbo_stream

        expect(assigns(:items)).to be_empty
        expect(response).to render_template(partial: '_search_results')
      end
    end

    context 'when the query is blank' do
      it 'returns no addresses' do
        get :search, params: { q: '' }, format: :turbo_stream

        expect(assigns(:items)).to be_empty
        expect(response).to render_template(partial: '_search_results')
      end
    end
  end
end