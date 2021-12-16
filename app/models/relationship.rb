class Relationship < ApplicationRecord
  has_many :users
  has_many :entries
  has_many :rems, through: :entries


end
