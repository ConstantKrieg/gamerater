require 'rails_helper'

RSpec.describe "platforms/index", type: :view do
  before(:each) do
    assign(:platforms, [
      Platform.create!(
        :title => "Title",
        :description => "MyText"
      ),
      Platform.create!(
        :title => "Title",
        :description => "MyText"
      )
    ])
  end

  it "renders a list of platforms" do
    render
    assert_select "tr>td", :text => "Title".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
  end
end
