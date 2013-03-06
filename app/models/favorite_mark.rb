class FavoriteMark < ActiveRecord::Base
  belongs_to :user
  belongs_to :status
  # attr_accessible :title, :body
end
