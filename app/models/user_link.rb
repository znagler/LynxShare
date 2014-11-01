class UserLink < ActiveRecord::Base
  belongs_to :user
  belongs_to :link
  validates :user_id,:link_id, :presence => true
  # validates_uniqueness_of :link_id, :scope => :tag_id
end
