require 'spec_helper'

RSpec.describe Review, type: :model do
  it "Does save with valid score" do
    review = Review.create title: "review", score: 9, content: "asdf"

    expect(review).to be_valid
    expect(Review.count).to eq(1)
  end

  it "Doesnt save with invalid score" do
    review = Review.create title: "review", score: 19, content: "asdf"

    expect(review).not_to be_valid
    expect(Review.count).to eq(0)
  end

  it "Doesnt save with invalid title" do
    review = Review.create  score: 19, content: "asdf"

    expect(review).not_to be_valid
    expect(Review.count).to eq(0)
  end

  it "Doesnt save with invalid content" do
    review = Review.create title: "review", score: 19

    expect(review).not_to be_valid
    expect(Review.count).to eq(0)
  end          
end
