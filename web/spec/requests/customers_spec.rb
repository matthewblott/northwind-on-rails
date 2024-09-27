require 'rails_helper'

RSpec.describe "Customers", type: :request do
  # let!(:customer) { FactoryBot.create(:customer) }
  let(:employee) { FactoryBot.create(:employee) }
  let(:customer) { FactoryBot.create(:customer, id: "456" ) }
  # describe "GET /index" do
  #   it "returns http success" do
  #     get customers_path
  #     expect(response).to have_http_status(:success)
  #   end
  # end
  # describe "GET /show" do
  #   it "returns http success" do
  #     get customer_path(customer)
  #     expect(response).to have_http_status(:success)
  #   end
  # end

  before do
    sign_in employee
  end

  describe "POST /customers" do
    it "creates a new customer" do
      expect {
        post :create, params: FactoryBot.attributes_for(:customer, id: "789")
     }.to change(Customer, :count).by(1)
     # expect(response).to redirect_to(customer_path(Customer.last))
    end
  end

  # describe "PATCH /update" do
  #   it "updates the customer" do
  #     patch customer_path(customer), params: { customer_id: customer.id, company_name: 'Updat
  #     Company' }
  #     expect(response).to redirect_to(customer_path(customer))
  #     customer.reload
  #     expect(customer.company_name).to eq('Updated Company')
  #   end
  # end
  #
  # describe "DELETE /destroy" do
  #   it "deletes the customer" do
  #     expect {
  #       delete customer_path(customer_id: customer.id)
  #     }.to change(Customer, :count).by(-1)
  #     expect(response).to redirect_to(customers_path)
  #   end
  # end
 end
