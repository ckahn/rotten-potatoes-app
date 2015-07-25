class ReviewsController < ApplicationController
  def create
    @review = Review.new(review_params)
    if @review.save
      render json: @review
    else
      render json: @review.errors.full_messages, status: :unprocessable_entity
    end
  end

  def index
    @reviews = Review.order(created_at: :desc)
  end

  private

  def review_params
    params.require(:review).permit(:email, :rating, :movie_id, :movie_title)
  end
end
