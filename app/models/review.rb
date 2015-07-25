class Review < ActiveRecord::Base
  validates :email, :rating, :movie_id, :movie_title, presence: true
end
