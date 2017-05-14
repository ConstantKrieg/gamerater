require 'rails_helper'


describe "reviewlist page" do
  
  let!(:user) { FactoryGirl.create :user }
  let!(:user2) { FactoryGirl.create :user2 }   

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
    @review = FactoryGirl.create(:review, id: 1, title: "testreview", score: 5, content:"testcontent", game: @game1)
    @comment = FactoryGirl.create(:comment, id: 1, content: "testcomment", review: @review)
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

   it "shows a known review", :js => true do
    visit reviews_path
   
  
    expect(page).to have_content "testreview"
  end

  it "can visit review page", :js => true do
    visit reviews_path
    
    
    click_link "testreview"
    
    expect(page).to have_content "testcontent"
  end

  it "can view and delete comments", :js => true do
    visit reviews_path
    
    
    click_link "testreview"
    click_button "Show comments"
    click_button "Delete"
    page.driver.browser.switch_to.alert.accept

    expect(page).to have_content "Comment was successfully destroyed."
  end

  it "can add comments", :js => true do
    visit reviews_path
    
    
    click_link "testreview"
    click_button "Show comments"
    fill_in('commentArea', with:"commenting...")
    find("#commentButton").click
    

    expect(page).to have_content "commenting..."
  end

  it "admin can delete a review", :js => true do
    visit reviews_path
    
    
    click_link "Delete"
    page.driver.browser.switch_to.alert.accept
    
    expect(page).to have_content "Review was successfully destroyed."
  end

  it "non admin cant delete a review", :js => true do
    click_link "Sign out"
    visit signin_path
    fill_in('username', with:"Pekka3")
    fill_in('password', with:"Foobar1")
    click_button('Log in')  
    visit reviews_path
    
    
    
    
    expect(page).not_to have_content "Delete"
  end     
end