require 'rails_helper'

RSpec.describe "reviews/edit", type: :view do
  before(:each) do
    @review = assign(:review, Review.create!(
      :title => "MyString",
      :content => "MyText",
      :score => 1,
      :user_id => 1,
      :game_id => 1
    ))
  end

  it "renders the edit review form" do
    render

    assert_select "form[action=?][method=?]", review_path(@review), "post" do

      assert_select "input#review_title[name=?]", "review[title]"

      assert_select "textarea#review_content[name=?]", "review[content]"

      assert_select "input#review_score[name=?]", "review[score]"

      assert_select "input#review_user_id[name=?]", "review[user_id]"

      assert_select "input#review_game_id[name=?]", "review[game_id]"
    end
  end
end
