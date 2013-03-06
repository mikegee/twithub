class User < ActiveRecord::Base

  has_many :statuses, foreign_key: 'author_id'

  attr_accessible :name, :email

  validates_presence_of :name, :email
  validates_uniqueness_of :email

  def to_s; name; end

end
