class User < ActiveRecord::Base

  has_many :statuses, foreign_key: 'author_id'

  has_many :favorite_marks
  has_many :favorites, through: :favorite_marks, source: :status

  has_many :outgoing_follows, class_name: 'Follow', foreign_key: 'follower_id'
  has_many :users_followed, through: :outgoing_follows, source: :followee

  has_many :incoming_follows, class_name: 'Follow', foreign_key: 'followee_id'
  has_many :followers, through: :incoming_follows, source: :follower

  attr_accessible :name, :email

  validates_presence_of :name, :email
  validates_uniqueness_of :email

  def to_s; name; end

  def timeline
    Status.where(author_id: [self] + users_followed)
  end

end
