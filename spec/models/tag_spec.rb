require 'rails_helper'

RSpec.describe Tag, :type => :model do
    context "Associates with links" do
    it { should have_many(:link_tags)}
    it { should have_many(:links)}
    end

  context "Validates names" do
    it "should not allow empty names" do
      FactoryGirl.build(:tag, :name => "").should_not be_valid
    end
    it "accounts for name length" do
      FactoryGirl.build(:tag, :name => "1").should_not be_valid
      FactoryGirl.build(:tag, :name => "real_tagname").should be_valid
    end

  end

end
