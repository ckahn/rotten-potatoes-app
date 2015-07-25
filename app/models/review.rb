class Review < ActiveRecord::Base
  validates :email, :rating, :movie_id, presence: true
end
