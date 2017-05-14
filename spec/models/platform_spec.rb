require 'rails_helper'

RSpec.describe Platform, type: :model do
  it "Does save with valid name" do
    platform = Platform.create title: "plat", description: "assa"

    expect(platform).to be_valid
    expect(Platform.count).to eq(1)
  end

  it "Doesnt save with invalid title" do
    platform = Platform.create description: "assa"

    expect(platform).not_to be_valid
    expect(Platform.count).to eq(0)
  end

  it "Doesnt save with invalid description" do
    platform = Platform.create title: "assa"

    expect(platform).not_to be_valid
    expect(Platform.count).to eq(0)
  end
end
