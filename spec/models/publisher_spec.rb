require 'rails_helper'

RSpec.describe Publisher, type: :model do
  require 'spec_helper'

  it "Does save with valid name" do
    publisher = Publisher.create name: "pub"

    expect(publisher).to be_valid
    expect(Publisher.count).to eq(1)
  end

  it "Doesnt save with invalid name" do
    publisher = Publisher.create name: ""

    expect(publisher).not_to be_valid
    expect(Publisher.count).to eq(0)
  end
end
