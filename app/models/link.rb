class Link < ActiveRecord::Base
  has_many :user_links
  has_many :users, :through :user_links
  has_many :link_tags
end
