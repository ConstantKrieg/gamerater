require 'rails_helper'

RSpec.describe "platforms/edit", type: :view do
  before(:each) do
    @platform = assign(:platform, Platform.create!(
      :title => "MyString",
      :description => "MyText"
    ))
  end

  it "renders the edit platform form" do
    render

    assert_select "form[action=?][method=?]", platform_path(@platform), "post" do

      assert_select "input#platform_title[name=?]", "platform[title]"

      assert_select "textarea#platform_description[name=?]", "platform[description]"
    end
  end
end
