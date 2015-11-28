require 'spec_helper'

describe Api::V1::SessionsController do

  describe "POST #create" do

    before(:each) do
      @user = FactoryGirl.create(:user)
    end

    context "when the credentials are correct" do

      before(:each) do
        credentials = { email: @user.email, password: "12345678" }
        post :create, { session: credentials }
      end

      it "returns the user record corresponding to the given credentials" do
        @user.reload
        expect(json_response[:auth_token]).to eql @user.auth_token
      end

      it { should respond_with 200 }
    end

    context "when credentials are invalid/incorrect" do
      expect(json_response[:errors]).to eql "Invalid email or password"
    end

    it { should respond_with 422 }
  end

  describe "DELETE #destroy" do

    before(:each) do
      @user = FactoryGirl.create :user
      sign_in @user, store: false
      delete :destroy, id: @user.auth_token
    end

    it { should resond_with 204 }

  end
end
