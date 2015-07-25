class Review < ActiveRecord::Base
  validates :email, :rating, :movie_id, :movie_title, presence: true
  validates_uniqueness_of :email, scope: :movie_id
end
