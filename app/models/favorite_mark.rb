class FavoriteMark < ActiveRecord::Base

  attr_accessible :status_id

  belongs_to :user
  belongs_to :status

  validates_presence_of :user_id, :status_id

  validates_uniqueness_of :status_id, scope: :user_id

end
