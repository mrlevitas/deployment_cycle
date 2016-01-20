class Event < ActiveRecord::Base
  belongs_to :timeline, foreign_key: 'timeline_id'

  validates :title, presence: true
  validates :date_and_time, presence: true
end
