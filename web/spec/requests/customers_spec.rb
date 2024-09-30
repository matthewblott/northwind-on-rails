require 'rails_helper'

RSpec.describe "Customers", type: :request do
  describe "GET /customers" do
    it "returns a successful response" do
      get index_customer_path
      expect(response).to have_http_status(:success)
    end
  end
end
