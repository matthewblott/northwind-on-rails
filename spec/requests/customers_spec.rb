require 'rails_helper'

RSpec.describe "Customers", type: :request do
  let!(:customer) { create(:customer) }

  describe "GET /index" do
    it "returns http success" do
      get customers_path
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /show" do
    it "returns http success" do
      get customer_path(customer)
      expect(response).to have_http_status(:success)
    end
  end

  describe "POST /create" do
    it "creates a new customer" do
      expect {
        post customers_path, params: { id: 'new_id', company_name: 'New Company', contact_name: 'John Doe', contact_title: 'Manager', phone: '1234567890', fax: '0987654321' }
      }.to change(Customer, :count).by(1)
      expect(response).to redirect_to(customer_path(Customer.last))
    end
  end

  describe "PATCH /update" do
    it "updates the customer" do
      patch customer_path(customer), params: { id: customer.id, company_name: 'Updated Company' }
      expect(response).to redirect_to(customer_path(customer))
      customer.reload
      expect(customer.company_name).to eq('Updated Company')
    end
  end

  describe "DELETE /destroy" do
    it "deletes the customer" do
      expect {
        delete customer_path(id: customer.id)
      }.to change(Customer, :count).by(-1)
      expect(response).to redirect_to(customers_path)
    end
  end
end
