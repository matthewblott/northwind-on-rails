require 'rails_helper'

RSpec.describe "Customers", type: :request do
  let(:employee) { FactoryBot.create(:employee) }

  before do
    sign_in employee
  end

  let(:customer_attributes) { FactoryBot.attributes_for(:customer) }
  let!(:customer) { FactoryBot.create(:customer) }

  describe "GET /customers" do
    it "returns a successful response" do
      get index_customer_path
      expect(response).to have_http_status(:success)
    end
  end

  describe "POST /customers" do
    it "creates a new customer" do
      expect {
        post create_customer_path, params: { customer: customer_attributes }
      }.to change(Customer, :count).by(1)
      expect(response).to redirect_to(show_customer_path(Customer.last))
    end
  end

  # describe "PATCH /customers/:customer_id" do
  #   it "updates the customer" do
  #     patch update_customer_path(customer), params: { customer: { company_name: "Updated Company" } }
  #     customer.reload
  #     expect(customer.company_name).to eq("Updated Company")
  #     expect(response).to redirect_to(show_customer_path(customer))
  #   end
  # end
  #
  # describe "DELETE /customers/:customer_id" do
  #   it "deletes the customer" do
  #     expect {
  #       delete destroy_customer_path(customer)
  #     }.to change(Customer, :count).by(-1)
  #     expect(response).to redirect_to(index_customer_path)
  #   end
  # end
end
