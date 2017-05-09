require 'rails_helper'

describe "Publishers page" do
  it "should not have any before been created" do
    visit publishers_path
    expect(page).to have_content 'Publishers'


  end

  describe "when publishers exists" do
    before :each do
      @publishers = ["Kunos", "Codemasters", "SimBin"]
      @publishers.each do |publisher_name|
        FactoryGirl.create(:publisher, name: publisher_name)
      end

      visit publishers_path
    end

    it "lists publishers" do
     
      @publishers.each do |publisher_name|
        expect(page).to have_content publisher_name
      end
    end

    it "allows user to navigate to a single brewery page" do
      click_link "Kunos"

      expect(page).to have_content "Kunos"
    end

  end
end