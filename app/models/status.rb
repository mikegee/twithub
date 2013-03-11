class Status < ActiveRecord::Base

  belongs_to :author, class_name: 'User'

  has_many :mentions
  has_many :mentioned_users, through: :mentions, source: :user

  scope :direct,   -> { where(direct: true)  }
  scope :timeline, -> { where(direct: false) }

  attr_accessible :content, :recipient_id

  validates :author, presence: true
  validates :content,   presence: true, length: { maximum: 200 }

  validates :author, if: :direct?, inclusion: { in: ->(status) { status.recipient.users_followed } }

  default_scope order("#{table_name}.created_at DESC")

  before_save :scan_for_mentions

  def recipient
    @recipient ||= User.find(recipient_id) if recipient_id
  end

  def recipient_id
    @recipient_id
  end

  def recipient_id=(rid)
    if rid.present?
      self.direct = true
      @recipient_id = rid
    end
  end


  private

  def scan_for_mentions
    content.to_s.scan /(\A|\W)(@(\w+))/ do
      if u = User.find_by_nickname($3)
        mentioned_users << u
      end
    end
    mentioned_users << User.find(recipient_id) if direct?
  end

end
