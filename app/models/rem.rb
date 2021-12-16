class Rem < ApplicationRecord
  belongs_to :user
  belongs_to :entry, optional: true

  validates_presence_of :content
end
