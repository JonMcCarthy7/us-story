class Entry < ApplicationRecord
  belongs_to :user
  belongs_to :relationship

  has_one_attached :main_image
  has_many_attached :images

  has_rich_text :content

  # Validations
  validates_presence_of :title, :description, :start_date, :event_type, :content

  scope :relationship_event_types, lambda { |relationship|
    where(relationship: relationship).where.not(type: 'ParentEntry').order(event_type: :asc).pluck(:event_type).uniq
  }

  def trip?
    event_type == 'Trip'
  end

end

#     t.string "title"
#     t.text "description"
#     t.date "start_date"
#     t.date "end_date"
#     t.string "event_type"
#     t.string "type"
#     t.string "status"
#     t.bigint "user_id"
#     t.bigint "relationship_id"
#     t.bigint "entry_id"
#     t.datetime "created_at", precision: 6, null: false
#     t.datetime "updated_at", precision: 6, null: false
#     t.index ["entry_id"], name: "index_entries_on_entry_id"
#     t.index ["relationship_id"], name: "index_entries_on_relationship_id"
#     t.index ["user_id"], name: "index_entries_on_user_id"
