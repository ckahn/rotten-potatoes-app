class Review < ActiveRecord::Base
  validates :email, :rating, presence: true
end
