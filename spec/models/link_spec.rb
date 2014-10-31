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


end
