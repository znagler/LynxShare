class Tag < ActiveRecord::Base
  has_many :link_tags
  has_many :links, through: :link_tags
  validates :name, :presence => true
  validates :name, length: { minimum: 2 }
end
