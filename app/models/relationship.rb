class Relationship < ActiveRecord::Base
  attr_accessible :followed_id

  belongs_to :follower, class_name: "User"
  belongs_to :followed, class_name: "User"

  validates :follower_id, presence: true
  validates :followed_id, presence: true

  def self.from_users_followed_by(user)
    followed_user_ids = user.followed_user_ids.join(', ')
    where("user_id IN (?) OR user_id = ?", followed_user_ids, user)
  end
end
