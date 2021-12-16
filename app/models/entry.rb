class Entry < ApplicationRecord
  belongs_to :user
  belongs_to :relationship

  has_many :child_entries

  has_rich_text :content

  def trip?
    event_type == 'Trip'
  end

end
