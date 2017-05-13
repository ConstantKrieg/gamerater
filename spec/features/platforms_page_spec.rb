require 'rails_helper'


describe "platform page" do
  
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

    
    @platform1 = FactoryGirl.create (:platform)
    @platform2 = FactoryGirl.create(:platform, title: "PC", description:"aaaaaa")
    
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

   it "shows a known platform", :js => true do
    visit platforms_path
    find('table').find('tr:nth-child(2)')
    expect(page).to have_content "anonymous"
  end

  it "can visit platforms page", :js => true do
    visit platforms_path
    find('table').find('tr:nth-child(2)')
    
    click_link "anonymous"
    
    expect(page).to have_content "Title: anonymous"
  end

  it "can create a platform", :js => true do
    visit platforms_path
    

    find('#newPlatform').click
    fill_in('platName', with:"testPlatform")
    fill_in('platDesc', with:"testPlatform is very good")
    find("#addPlatform").click
    
    expect(page).to have_content "testPlatform"
end

end