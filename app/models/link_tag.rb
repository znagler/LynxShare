class LinkTag < ActiveRecord::Base
  belongs_to :link
  belongs_to :tag
  validates :link_id,:tag_id, :presence => true
end
