require 'rails_helper'


describe "gamelist page" do
  
  let!(:user) { FactoryGirl.create :user }  

  before :all do
    self.use_transactional_fixtures = false
    WebMock.disable_net_connect!(allow_localhost:true)
    Capybara.register_driver :selenium do |app|
      Capybara::Selenium::Driver.new(app, :browser => :chrome)
    end

  end

  before :each do
    DatabaseCleaner.strategy = :truncation
    DatabaseCleaner.start

    @publisher = FactoryGirl.create(:publisher, name: "Kunos")
    @publisher2 = FactoryGirl.create(:publisher, name: "Codemasters")
    @publisher3 = FactoryGirl.create(:publisher, name: "SimBin")
    @platform1 = FactoryGirl.create (:platform)
    @game1 = FactoryGirl.create(:game, name: "Assetto Corsa", publisher: @publisher, platforms: [@platform1])
    @game2 = FactoryGirl.create(:game, name: "F1 2016", publisher: @publisher2, platforms: [@platform1])
    @game3 = FactoryGirl.create(:game, name: "GTR 2", publisher: @publisher3, platforms: [@platform1])
    visit signin_path
    fill_in('username', with:"Pekka")
    fill_in('password', with:"Foobar1")
    click_button('Log in')
  end

  after :each do
    DatabaseCleaner.clean
  end

  after :all do
    self.use_transactional_fixtures = true
  end

   it "shows a known game", :js => true do
    visit games_path
    find('table').find('tr:nth-child(2)')
    expect(page).to have_content "GTR 2"
  end

  it "can visit games page", :js => true do
    visit games_path
    find('table').find('tr:nth-child(2)')
    
    click_link "GTR 2"
    
    expect(page).to have_content "Publisher: SimBin"
  end

  it "can review a game", :js => true do
    visit games_path
    find('table').find('tr:nth-child(2)')
    
    click_link "GTR 2"
    find('#reviewButton').click
    fill_in('review_title', with:"testreview")
    fill_in('review_content', with:"testreview")
    find("#createReview").click
    save_and_open_page
    expect(page).to have_content "Review was successfully created."
  end    
end
