require 'rails_helper'

RSpec.describe MoviesController, type: :controller do
  MOVIE_ID = 295099
  MOVIE_TITLE = "The Go-Go Boys: The Inside Story of Cannon Films"

  describe "GET #index" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end

    it "renders the index template" do
      get :index
      expect(response).to render_template("index")
    end
  end

  describe "GET #show" do
    it "returns http success" do
      get :show, id: MOVIE_ID
      expect(response).to have_http_status(:success)
    end

    it "renders the show template" do
      get :show, id: MOVIE_ID
      expect(response).to render_template("show")
    end

    it "gets the movie's API data" do
      get :show, id: MOVIE_ID
      expect(assigns(:movie_data)["title"]).to eq(MOVIE_TITLE)
    end

    it "gets the movie's reviews (newest first)" do
      attrs = { movie_id: MOVIE_ID, movie_title: MOVIE_TITLE, rating: "1" }
      review1 = Review.create!(attrs.merge(email: "user1@email.com"))
      review2 = Review.create!(attrs.merge(email: "user2@email.com"))
      get :show, id: MOVIE_ID
      expect(assigns(:reviews)).to eq([review2, review1])
    end
  end
end
