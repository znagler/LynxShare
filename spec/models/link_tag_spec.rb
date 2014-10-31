require 'rails_helper'

RSpec.describe LinkTag, :type => :model do
    context "Associates with links" do
    it { should belong_to(:link)}
    end


    context "Associates with tags" do
    it { should belong_to(:tag)}

    end

    context "ensures presence of link id and tag id" do
      it "should not allow link field" do
        FactoryGirl.build(:link_tag, :link_id => "").should_not be_valid
      end

      it "should not allow tag field" do
        FactoryGirl.build(:link_tag, :tag_id => "").should_not be_valid
      end

      it "should allow both" do
        FactoryGirl.build(:link_tag).should be_valid
      end

    end

end
