class Relationship < ActiveRecord::Base
  belongs_to :follower, class_name: :User, foreign_key: :follower_id
  belongs_to :followed_user, class_name: :User, foreign_key: :followed_user_id

  validates_uniqueness_of :follower_id, scope: :followed_user_id
end
