require 'rails_helper'

RSpec.describe User, :type => :model do
    context "Associates with links" do
    it { should have_many(:user_links)}
    it { should have_many(:links)}
    end

  context "Validates usernames" do
    it "should not allow empty username" do
      FactoryGirl.build(:user, :username => "").should_not be_valid
    end
    it "accounts for username length" do
      FactoryGirl.build(:user, :username => "123").should_not be_valid
      FactoryGirl.build(:user).should be_valid
    end
  end

  context "Validates passwords" do
    it "should not allow empty passwords" do
      FactoryGirl.build(:user, :password => "").should_not be_valid
    end
    it "accounts for password length" do
      FactoryGirl.build(:user, :password => "123").should_not be_valid
      FactoryGirl.build(:user, :password => "real_password", :password_confirmation => "real_password").should be_valid
    end

  end

end
