class User < ActiveRecord::Base

  include Gravtastic
  has_gravatar

  has_many :statuses, foreign_key: 'author_id'

  has_many :favorite_marks
  has_many :favorites, through: :favorite_marks, source: :status

  has_many :outgoing_follows, class_name: 'Follow', foreign_key: 'follower_id'
  has_many :users_followed, through: :outgoing_follows, source: :followee

  has_many :incoming_follows, class_name: 'Follow', foreign_key: 'followee_id'
  has_many :followers, through: :incoming_follows, source: :follower

  has_many :mentions
  has_many :mentioning_statuses, through: :mentions, source: :status

  attr_accessible :name, :email, :nickname

  validates_presence_of :name, :email, :nickname
  validates_uniqueness_of :email, :nickname
  validates_format_of :nickname, with: /\A\w+\z/

  def to_s; name; end

  def timeline
    Status.where(author_id: [self] + users_followed)
  end

  def favorite?(status)
    favorite_marks.exists?(status_id: status.id)
  end

  def follows?(user)
    outgoing_follows.exists?(followee_id: user.id)
  end

end
