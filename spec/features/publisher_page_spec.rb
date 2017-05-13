require 'rails_helper'


describe "publishers page" do
  
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

   it "shows a known publisher", :js => true do
    visit publishers_path
    find('table').find('tr:nth-child(2)')
    expect(page).to have_content "Kunos"
  end

  it "can visit publishers page", :js => true do
    visit publishers_path
    find('table').find('tr:nth-child(2)')
    
    click_link "Kunos"
    
    expect(page).to have_content "Kunos"
  end

  it "can create a publisher", :js => true do
    visit publishers_path
    

    find('#addPublisher').click
    fill_in('pubName', with:"testPublisher")
    find("#addPub").click
    
    expect(page).to have_content "testPublisher"
  end    
end