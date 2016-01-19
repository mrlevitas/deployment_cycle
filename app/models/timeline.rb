class Timeline < ActiveRecord::Base
  has_many :memberships
  has_many :users, through: :memberships

  validates :title, presence: true
end
