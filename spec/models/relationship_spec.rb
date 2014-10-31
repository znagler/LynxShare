require 'rails_helper'

RSpec.describe Relationship, :type => :model do
  context "Associates with followers" do
    it { should belong_to(:follower)}
    it { should belong_to(:followed_user)}
  end

end
