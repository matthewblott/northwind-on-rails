require 'rails_helper'

RSpec.describe ProductsController, type: :controller do
  let!(:employee) { FactoryBot.create(:employee) }
  let!(:product) { FactoryBot.create(:product) }

  before do
    sign_in employee
  end

  describe 'GET #index' do
    it 'returns a successful response' do
      get :index
      expect(response).to be_successful
      expect(assigns(:products)).not_to be_nil
    end
  end

  describe 'GET #new' do
    it 'assigns a new product' do
      get :new
      expect(assigns(:product)).to be_a_new(Product)
    end
  end

  describe 'POST #create' do
    let(:product) { FactoryBot.create(:product) } 

    let(:valid_attributes) { { product_code: 'FOO1234', product_name: 'Sample Product', description: 'This is a sample product description.', standard_cost: 50.0, list_price: 100.0, discontinued: false } }
    let(:invalid_attributes) { { product_code: '', product_name: 'Sample Product', description: 'This is a sample product description.', standard_cost: 50.0, list_price: 100.0 } }

    context 'with valid parameters' do
      it 'creates a new product' do
        expect do
          post :create, params: valid_attributes
        end.to change(Product, :count).by(1)
      end

      it 'redirects to the created product' do
        post :create, params: valid_attributes
        expect(response).to redirect_to(show_product_path(Product.last))
      end
    end

    context 'with invalid parameters' do
      it 'does not create a new product' do
        expect {
          post :create, params: invalid_attributes
        }.to change(Product, :count).by(0)
      end

      it 'renders the new template' do
        post :create, params: invalid_attributes
        expect(response).to render_template(:new)
      end
    end
  end

  describe 'PATCH #update' do
    context 'with valid parameters' do
      it 'updates the requested product' do
        patch :update, params: { product_id: product.id, product_name: 'New Name' }
        product.reload
        expect(product.product_name).to eq('New Name')
      end

      it 'redirects to the updated product' do
        patch :update, params: { product_id: product.id, product_name: 'New Name' }
        expect(response).to redirect_to(show_product_path(product))
      end
    end

    context 'with invalid parameters' do
      it 'does not update the product' do
        patch :update, params: { product_id: product.id, product_code: nil  }
        product.reload
        expect(product.product_code).not_to be_nil
      end

      it 'renders the edit template' do
        patch :update, params: { product_id: product.id, product_code: nil  }
        expect(response).to render_template(:edit)
      end
    end
  end

  describe 'DELETE #destroy' do
    it 'destroys the requested product' do
      product_to_delete = FactoryBot.create(:product, product_code: 'TODELETE')
      expect {
        delete :destroy, params: { product_id: product_to_delete.id }
      }.to change(Product, :count).by(-1)
    end
  
    it 'redirects to the products list' do
      delete :destroy, params: { product_id: product.id }
      expect(response).to redirect_to(index_product_path)
    end
  end

  describe 'GET #search' do
    before do
      FactoryBot.create(:product, product_code: '123XYZ')
    end

    context 'with query' do
      it 'returns search results' do
        get :search, params: { q: '123' }, format: :turbo_stream
        expect(response).to be_successful
        expect(assigns(:items)).not_to be_empty
      end
    end

    context 'without query' do
      it 'returns no search results' do
        get :search, params: { q: '' }, format: :turbo_stream
        expect(response).to be_successful
        expect(assigns(:items)).to be_empty
      end
    end
  end

end