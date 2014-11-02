class User < ActiveRecord::Base
  has_many :user_links
  has_many :links, through: :user_links

  has_many :tags, through: :links

  has_many :follower_relationships, class_name: :Relationship, foreign_key: :followed_user_id
  has_many :followed_relationships, class_name: :Relationship, foreign_key: :follower_id
  has_many :followers, through: :follower_relationships, source: :follower
  has_many :followed_users, through: :followed_relationships, source: :followed_user

  validates :password, length: { minimum: 5 }
  validates :username, :presence => true
  validates :username, length: { minimum: 5 }

  has_secure_password

  def unfollowed_users(num_users = 10)
    followed_user_ids = self.followed_users.pluck(:id) << self.id
    User.where.not(id: followed_user_ids).take(num_users)
  end
end
