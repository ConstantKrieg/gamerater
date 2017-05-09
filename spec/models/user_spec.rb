require 'spec_helper'

RSpec.describe User, type: :model do
  it "has the username set correctly" do
    user = User.new username: "Kana"

    user.username.should == "Kana"
  end

  it "Doesnt save without password" do
    user = User.create username: "Kana"

    expect(user).not_to be_valid
    expect(User.count).to eq(0)
  end

  it "Doesnt save with invalid password" do
    user = User.create username: "Kana", password: "ankka"

    expect(user).not_to be_valid
    expect(User.count).to eq(0)
  end

  it "Does save with valid password" do
    user = User.create username: "Kana", password: "Ankka1"

    expect(user).to be_valid
    expect(User.count).to eq(1)
  end             

end