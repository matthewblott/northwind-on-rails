require 'rails_helper'
require "capybara/cuprite"

describe RegionsController, type: :controller do
  describe 'POST #create' do
    let(:employee) { FactoryBot.create(:employee) } 

    before do
      sign_in employee
    end

    let(:valid_attributes) { { name: 'New Region' } }

    context 'with valid parameters' do
      it 'creates a new region' do
        expect do
          post :create, params: valid_attributes  
        end.to change(Region, :count).by(1)
      end
    end

    let(:invalid_attributes) { { name: '' } }

    context 'with invalid parameters' do
      it 'does not create a new region' do
        expect do
          post :create, params: invalid_attributes  
        end.to change(Region, :count).by(0)
      end
    end

  end

  describe 'PATCH #update' do
    let(:employee) { FactoryBot.create(:employee) } 
    let(:region) { FactoryBot.create(:region) }

    before do
      sign_in employee
    end

    let(:valid_attributes) { { name: 'Updated Region' } }

    context 'with valid parameters' do

      it 'updates the requested region and redirects to the show page with a success notice' do
        patch :update, params: { region_id: region.id, name: 'Updated Region' }

        region.reload
        expect(region.name).to eq('Updated Region')

        expect(response).to redirect_to(show_region_path(region))
        expect(flash[:notice]).to eq('Region was successfully updated.')
        expect(response).to have_http_status(:see_other) # Status 303
      end
    end

    context 'with invalid parameters' do
      it 'does not update the region' do
        patch :update, params: { region_id: region.id, name: '' }
        expect(region.reload.name).not_to eq('')
      end

      it 'renders the edit template' do
        patch :update, params: { region_id: region.id, name: '' }
        expect(response).to render_template(:edit)
      end

      it 'returns a 422 status code' do
        patch :update, params: { region_id: region.id, name: '' }
        expect(response.status).to eq(422)
      end
    end
  end

  describe 'DELETE #destroy' do
    let(:employee) { FactoryBot.create(:employee) }
    let!(:region) { FactoryBot.create(:region) }

    before do
      sign_in employee
    end

    it 'destroys the requested region and redirects to the regions list with a success notice' do
      expect do
        delete :destroy, params: { region_id: region.id }
      end.to change(Region, :count).by(-1)

      expect(response).to redirect_to(index_region_path)
      expect(flash[:notice]).to eq('Region was successfully destroyed.')
      expect(response).to have_http_status(:see_other) # Status 303
    end
  end

  describe 'GET #search' do
    let(:employee) { FactoryBot.create(:employee) }
    let!(:region) { FactoryBot.create(:region) }
  
    before do
      sign_in employee
    end
  
    let!(:region1) { FactoryBot.create(:region, name: 'North') }
    let!(:region2) { FactoryBot.create(:region, name: 'South') }
    let!(:region3) { FactoryBot.create(:region, name: 'East') }
  
    it 'renders search results with matching regions' do
      get :search, params: { q: 'No' }, format: :turbo_stream
  
      expect(response).to have_http_status(:ok)
      expect(response).to render_template(partial: '_search_results')
      
      items = assigns(:items)
      expect(items.values).to include('North')
      expect(items.values).not_to include('South')
      expect(items.values).not_to include('East')
    end

    it 'renders an empty search result when no regions match' do
      get :search, params: { q: 'West' }, format: :turbo_stream
      expect(response).to have_http_status(:ok)
      expect(assigns(:items)).to be_empty
    end
  end

end