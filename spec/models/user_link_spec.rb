require 'rails_helper'

RSpec.describe UserLink, :type => :model do
  describe "test" do
  it "One + One = Two" do
    expect(1+1).to equal(2)
  end

  it "One + One != Three" do
    expect(1+1).to_not equal(3)
  end
  end
end
