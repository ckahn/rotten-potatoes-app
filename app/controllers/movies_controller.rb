require 'open-uri'
require 'json'

class MoviesController < ApplicationController
  def index
  end

  def show
    @movie_data = JSON.load(open(movie_api_url(params[:id])))
    @reviews = Review.where(movie_id: params[:id]).order(created_at: :desc)
  end
end
