require 'rails_helper'

RSpec.describe "platforms/new", type: :view do
  before(:each) do
    assign(:platform, Platform.new(
      :title => "MyString",
      :description => "MyText"
    ))
  end

  it "renders new platform form" do
    render

    assert_select "form[action=?][method=?]", platforms_path, "post" do

      assert_select "input#platform_title[name=?]", "platform[title]"

      assert_select "textarea#platform_description[name=?]", "platform[description]"
    end
  end
end
