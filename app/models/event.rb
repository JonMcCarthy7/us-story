class Event < ApplicationRecord
  belongs_to :user
  belongs_to :relationship

  has_many :events, class_name: 'Event', foreign_key: :event_id
  has_many :comments
end
