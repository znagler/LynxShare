class Link < ActiveRecord::Base
  has_many :user_links
  has_many :users, :through :user_links
  has_many :link_tags
  has_many :tags, :through :link_tags
end
