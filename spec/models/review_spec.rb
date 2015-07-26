require 'rails_helper'

RSpec.describe Review, type: :model do
  describe "presence validations" do
    it { should validate_presence_of :email }
    it { should validate_presence_of :movie_id }
    it { should validate_presence_of :movie_title }
    it { should validate_presence_of :rating }
  end

  let(:review) do
    review = Review.new(
      email: "user@email.com",
      movie_id: "1",
      movie_title: "Title",
      rating: "1"
    )
  end

  context "when all attributes are good" do
    it "should be valid" do
      expect(review.valid?).to be true
    end
  end

  context "when email format is good" do
    it "should be valid" do
      good_emails = [
        "user@email.com",
        "user1@email.com",
        "user-1@email.com",
        "user.name@email.com",
        "user.name+1@email.com",
        "USER@EMAIL.COM",
      ]
      good_emails.each do |email|
        review.email = email
        expect(review.valid?).to be true
      end
    end
  end

  context "when email format is bad" do
    it "should be invalid" do
      bad_emails = [
        "",
        "user",
        "user@email",
        "email.com",
        "a@.com",
        "@.com",
        "@a.com",
        "user@email.c",
        "user@email.comm",
        "user@email@email.com",
        "us*r@email.com"
      ]
      bad_emails.each do |email|
        review.email = email
        expect(review.valid?).to be false
      end
    end
  end

  context "when user has already reviewed movie" do
    it "should be invalid" do
      review_dup = review.dup
      review.save!
      expect(review_dup.valid?).to be false
    end
  end
end