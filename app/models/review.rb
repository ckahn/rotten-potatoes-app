class Review < ActiveRecord::Base
  validates :email, :rating, :movie_id, :movie_title, presence: true
  VALID_EMAIL_REGEX = /[\w\-\+\.]+@[\w\-\+\.]+\.[a-z]{2,}/i
  validates :email, format: { with: VALID_EMAIL_REGEX }
  validates_uniqueness_of :email, scope: :movie_id
end
