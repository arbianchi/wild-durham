require 'rails_helper'

RSpec.describe Observation, type: :model do
  it "has a valid factory" do
    expect(FactoryGirl.create(:observation)).to be_valid
  end
  it "is invalid without an email"
  it "is invalid without a phone number"
  it "returns phone as a string"
end
