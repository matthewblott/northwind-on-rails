require 'rails_helper'

describe CustomersController, type: :controller do
  let(:employee) { FactoryBot.create(:employee) }
  let(:customer) { FactoryBot.create(:customer, id: "456" ) }

  before do
    sign_in employee
  end

  describe 'GET #index' do
    it 'assigns all customers to @customers' do
      get :index
      expect(assigns(:customers)).to eq([customer])
    end
  end

  describe 'GET #show' do
    it 'assigns the requested customer to @customer' do
      get :show, params: { customer_id: customer.id }
      expect(assigns(:customer)).to eq(customer)
    end
  end

  describe 'GET #new' do
    it 'assigns a new customer to @customer' do
      get :new
      expect(assigns(:customer)).to be_a_new(Customer)
    end
  end

  describe 'POST #create' do
    context 'with valid attributes' do
      it 'creates a new customer' do
        expect {
          post :create, params: FactoryBot.attributes_for(:customer, id: "789")
        }.to change(Customer, :count).by(1)
      end

      it 'redirects to the new customer' do
        post :create, params: FactoryBot.attributes_for(:customer, id: "789")
        expect(response).to redirect_to(show_customer_path(Customer.last))
      end
    end

    # context 'with invalid attributes' do
    #   it 'does not save the new customer' do
    #     expect {
    #       post :create, params: { customer: attributes_for(:customer, name: nil) }
    #     }.to_not change(Customer, :count)
    #   end
    #
    #   it 're-renders the new template' do
    #     post :create, params: { customer: attributes_for(:customer, name: nil) }
    #     expect(response).to render_template('new')
    #   end
    # end
  end

  # describe 'GET #edit' do
  #   it 'assigns the requested customer to @customer' do
  #     get :edit, params: { customer_id: customer.id }
  #     expect(assigns(:customer)).to eq(customer)
  #   end
  # end

  # describe 'PATCH #update' do
  #   context 'with valid attributes' do
  #     it 'updates the requested customer' do
  #       patch :update, params: { customer_id: customer.id, customer: { name: 'Updated Name' } }
  #       customer.reload
  #       expect(customer.name).to eq('Updated Name')
  #     end
  #
  #     it 'redirects to the customer' do
  #       patch :update, params: { customer_id: customer.id, customer: { name: 'Updated Name' } }
  #       expect(response).to redirect_to(customer)
  #     end
  #   end
  #
  #   context 'with invalid attributes' do
  #     it 'does not update the customer' do
  #       patch :update, params: { customer_id: customer.id, customer: { name: nil } }
  #       customer.reload
  #       expect(customer.name).to_not eq(nil)
  #     end
  #
  #     it 're-renders the edit template' do
  #       patch :update, params: { customer_id: customer.id, customer: { name: nil } }
  #       expect(response).to render_template('edit')
  #     end
  #   end
  # end

  # describe 'DELETE #destroy' do
  #   it 'deletes the customer' do
  #     customer # Ensure the customer is created
  #     expect {
  #       delete :destroy, params: { customer_id: customer.id }
  #     }.to change(Customer, :count).by(-1)
  #   end
  #
  #   it 'redirects to customers#index' do
  #     delete :destroy, params: { customer_id: customer.id }
  #     expect(response).to redirect_to(customers_path)
  #   end
  # end
end
