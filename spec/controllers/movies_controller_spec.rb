require 'rails_helper'

RSpec.describe MoviesController, type: :controller do

  describe "GET #reviews" do
    it "returns http success" do
      get :reviews
      expect(response).to have_http_status(:success)
    end
  end

end
