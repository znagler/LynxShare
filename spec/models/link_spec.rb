require 'rails_helper'

RSpec.describe Link, :type => :model do

    context "Associates with users" do
    it { should have_many(:user_links)}
    it { should have_many(:users)}
    end

    context "Associates with tags" do
    it { should have_many(:link_tags)}
    it { should have_many(:tags)}
    end

    context "Validates URLs" do
    it "should not allow empty URL" do
      FactoryGirl.build(:link, :url => "").should_not be_valid
    end
    it "should not allow invalid" do
      FactoryGirl.build(:link, :url => "google  com").should_not be_valid
      FactoryGirl.build(:link, :url => "googlecom").should_not be_valid
    end

    it "should allow valid urls" do
      FactoryGirl.build(:link, :url => "google.com").should be_valid
    end

  end

end
