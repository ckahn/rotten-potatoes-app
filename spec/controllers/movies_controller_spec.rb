require 'rails_helper'

RSpec.describe MoviesController, type: :controller do
  movie_id = 295099

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
      get :show, id: movie_id
      expect(response).to have_http_status(:success)
    end

    it "renders the show template" do
      get :show, id: movie_id
      expect(response).to render_template("show")
    end

    it "gets the movie's data" do
      get :show, id: movie_id
      expect(assigns(:movie_data)["title"]).to eq("The Go-Go Boys: The Inside Story of Cannon Films")
    end

    it "gets the movie's newer reviews first" do
      review1 = Review.create!(
        email: "user1@email.com",
        movie_id: movie_id,
        movie_title: "The Go-Go Boys: The Inside Story of Cannon Films",
        rating: "1"
      )
      review2 = Review.create!(
        email: "user2@email.com",
        movie_id: movie_id,
        movie_title: "The Go-Go Boys: The Inside Story of Cannon Films",
        rating: "1"
      )
      get :show, id: 295099
      expect(assigns(:reviews)).to eq([review2, review1])
    end
  end
end
