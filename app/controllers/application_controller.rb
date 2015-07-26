include ActionView::Helpers::DateHelper

class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def movie_api_url(id)
    'http://api.themoviedb.org/3/movie/' + id +
    '?api_key=e505edada279c368d098a520d3fd7992'
  end
end
