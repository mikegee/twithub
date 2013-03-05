class Status < ActiveRecord::Base

  belongs_to :author, class_name: 'User'

  attr_accessible :content

  validates :author_id, presence: true, numericality: true
  validates :content,   presence: true, length: { maximum: 200 }

end
