require 'open-uri'
require 'json'

class MoviesController < ApplicationController
  def index
  end

  def show
    @film_data = JSON.load(
      open('http://api.themoviedb.org/3/movie/' + params[:id] +
      '?api_key=e505edada279c368d098a520d3fd7992')
    )
  end
end
