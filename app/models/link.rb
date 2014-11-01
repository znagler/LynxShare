class Link < ActiveRecord::Base
  has_many :user_links
  has_many :users, through: :user_links
  has_many :link_tags
  has_many :tags, through: :link_tags
  validates :url, :presence => true
  validates :url, format: { with: /\A\S+\.\S+\Z/i }


  def create_tags(tags)
    tags.each do |tag|
      LinkTag.create(link: self, tag: Tag.find_or_create_by(name: tag))
    end
  end

end
