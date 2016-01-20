class Timeline < ActiveRecord::Base
  has_many :memberships
  has_many :users, through: :memberships

  has_many :events, foreign_key: 'timeline_id'

  belongs_to :user, foreign_key: 'creator_id'

  validates :title, presence: true
end
