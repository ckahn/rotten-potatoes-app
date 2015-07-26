require 'rails_helper'

RSpec.describe ReviewsController, type: :controller do
  attrs = { movie_id: 1, movie_title: "Title", rating: "4" }

  describe "POST #create" do
    context "when params are valid" do
      let(:valid_attrs) do
        { email: "user@email.com",
          movie_id: 1,
          movie_title: "Title",
          rating: "4" }
      end

      it "should save model" do
        expect {
          post :create, review: valid_attrs
        }.to change(Review, :count).by(1)
      end
    end

    context "when params are invalid" do
      # TODO find out why an empty hash produces errors
      let(:invalid_attrs) { { email: "" } }

      it "should not save model" do
        expect {
          post :create, review: invalid_attrs
        }.to_not change(Review, :count)
      end

      it "should return 422 error" do
        post :create, review: invalid_attrs
        expect(response).to have_http_status(422)
      end
    end
  end

  describe "GET #index" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end

    it "gets all reviews (newest first)" do
      review1 = Review.create!(attrs.merge(email: "user1@email.com"))
      review2 = Review.create!(attrs.merge(email: "user2@email.com"))
      get :index
      expect(assigns(:reviews)).to eq([review2, review1])
    end
  end
end
