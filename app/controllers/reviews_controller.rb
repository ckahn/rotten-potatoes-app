class ReviewsController < ApplicationController
  def create
    @review = Review.new(review_params)
    if @review.save
      render json: @review
    else
      render text: @review.errors.full_messages
    end
  end

  private

  def review_params
    params.require(:review).permit(:email, :rating)
  end
end
