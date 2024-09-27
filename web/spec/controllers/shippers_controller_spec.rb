require 'rails_helper'

RSpec.describe ShippersController, type: :controller do
  let(:employee) { FactoryBot.create(:employee) } 
  let(:shipper) { FactoryBot.create(:shipper) } 

  before do
    sign_in employee
  end

  describe "GET #index" do
    it "returns a successful response" do
      get :index
      expect(response).to have_http_status(:success)
    end

    it "assigns @shippers" do
      get :index
      expect(assigns(:shippers)).to eq([shipper])
    end
  end

  describe "GET #show" do
    it "returns a successful response" do
      get :show, params: { shipper_id: shipper.id }
      expect(response).to have_http_status(:success)
    end

    it "assigns the requested shipper to @shipper" do
      get :show, params: { shipper_id: shipper.id }
      expect(assigns(:shipper)).to eq(shipper)
    end
  end

  let(:valid_attributes) { { company_name: 'New Shipper', phone: '123-456-7890' } }
  let(:invalid_attributes) { { company_name: 'New Shipper', phone: '' } }

  describe "POST #create" do
    context "with valid attributes" do
      it "creates a new shipper" do
        expect {
          post :create, params: valid_attributes  
        }.to change(Shipper, :count).by(1)
      end

      # it "redirects to the new shipper's show page" do
      #   post :create, params: valid_attributes  
      #   expect(response).to redirect_to(Shipper.last)
      # end
    end

    context "with invalid attributes" do
      it "does not save the new shipper" do
        expect {
          post :create, params: invalid_attributes  
        }.to_not change(Shipper, :count)
      end

      it "re-renders the new template" do
        post :create, params: invalid_attributes  
        expect(response).to render_template(:new)
      end
    end
  end

  describe "PUT #update" do
    context "with valid attributes" do
      it "updates the shipper" do
        patch :update, params: { shipper_id: shipper.id, company_name: "Updated Name" }
        shipper.reload
        expect(shipper.company_name).to eq("Updated Name")
      end

      it "redirects to the updated shipper's show page" do
        patch :update, params: { shipper_id: shipper.id, company_name: "Updated Name" }
        expect(response).to redirect_to(show_shipper_path(shipper))
      end
    end

    context "with invalid attributes" do
      it "does not update the shipper" do
        patch :update, params: { shipper_id: shipper.id, company_name: "" }
        shipper.reload
        expect(shipper.company_name).to_not eq(nil)
      end

      it "re-renders the edit template" do
        patch :update, params: { shipper_id: shipper.id, company_name: "" }
        expect(response).to render_template(:edit)
      end
    end
  end

end