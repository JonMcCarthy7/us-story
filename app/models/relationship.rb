class Relationship < ApplicationRecord
  has_many :users
  has_many :entries
  has_many :parent_entries, class_name: 'ParentEntry'
  # has_many :rems
  # has_many :entry_rems, class_name: 'Rem', through: :entries


end
