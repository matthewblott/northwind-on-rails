require 'rails_helper'

RSpec.describe "Customers", type: :request do
  let(:employee) { FactoryBot.create(:employee) }

  before do
    sign_in employee
  end

  describe "GET /customers" do
    it "returns a successful response" do
      get index_customer_path
      expect(response).to have_http_status(:success)
    end
  end
end
