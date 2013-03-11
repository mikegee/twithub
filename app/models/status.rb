class Status < ActiveRecord::Base

  belongs_to :author, class_name: 'User'

  has_many :mentions
  has_many :mentioned_users, through: :mentions, source: :user

  attr_accessible :content

  validates :author, presence: true
  validates :content,   presence: true, length: { maximum: 200 }

  default_scope order("#{table_name}.created_at DESC")

  before_save :scan_for_mentions


  private

  def scan_for_mentions
    content.to_s.scan /(\A|\W)(@(\w+))/ do
      if u = User.find_by_nickname($3)
        mentioned_users << u
      end
    end
  end

end
