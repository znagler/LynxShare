require 'rails_helper'

RSpec.describe UserLink, :type => :model do
    context "Associates with users" do
    it { should belong_to(:user)}
    end


    context "Associates with links" do
    it { should belong_to(:link)}
    end


    context "ensures presence of user id and link id" do
      it "should not allow user field" do
        FactoryGirl.build(:user_link, :user_id => "").should_not be_valid
      end

      it "should not allow link field" do
        FactoryGirl.build(:user_link, :link_id => "").should_not be_valid
      end

      it "should allow presence of both" do
        FactoryGirl.build(:user_link).should be_valid
      end

    end

end
