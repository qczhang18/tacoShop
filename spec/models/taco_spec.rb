require 'rails_helper'

RSpec.describe Taco, :type => :model do

  it "has a valid factory" do
    create(:taco).should be_valid
  end

  it "at creation should equal to last on database" do
    taco = create(:taco)
    result = Taco.last
    expect(result).to eq taco
  end

  it "is invalid without a meat" do
    build(:taco, meat: nil).should_not be_valid
  end

  it "is invalid without saying yes or no selection on toppings" do
    build(:taco, salsa: nil).should_not be_valid
  end

end
