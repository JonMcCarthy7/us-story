class Entry < ApplicationRecord
  belongs_to :user
  belongs_to :relationship

  has_many :child_entries

  has_one_attached :main_image
  has_many_attached :images

  has_rich_text :content

  scope :relationship_event_types, ->(relationship) { where(relationship: relationship).order(event_type: :asc).pluck(:event_type).uniq }

  def trip?
    event_type == 'Trip'
  end

end
