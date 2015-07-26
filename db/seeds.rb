require 'open-uri'
require 'json'

API_URL = 'http://api.themoviedb.org/3/discover/movie?' +
  'with_cast=51576&sort_by=release_date.desc&' +
  'api_key=e505edada279c368d098a520d3fd7992'

movie_data = JSON.load(open(API_URL))
movie_data['results'].each do |movie_h|
  3.times do
    review = Review.create!(
      email: Faker::Internet.email,
      movie_id: movie_h['id'],
      movie_title: movie_h['title'],
      rating: %w[1 2 3 4].sample
    )
  end
end

Review.all.each do |review|
  review.created_at = Time.now - rand(9000000)
  review.save
end
