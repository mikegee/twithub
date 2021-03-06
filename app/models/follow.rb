class Follow < ActiveRecord::Base

  attr_accessible :follower_id, :followee_id

  belongs_to :follower, class_name: 'User'
  belongs_to :followee, class_name: 'User'

  validates_presence_of :follower_id, :followee_id
  validates_uniqueness_of :follower_id, scope: :followee_id

end
