# frozen_string_literal: true

class ParentEntry < Entry
  has_many :child_entries, foreign_key: :entry_id, dependent: :destroy

  validates_presence_of :end_date

  validate :start_and_end_date

  scope :relationship_parent_event_types, lambda { |relationship|
    where(relationship: relationship).order(event_type: :asc).pluck(:event_type).uniq
  }

  private

  def start_and_end_date
    return if end_date > start_date
    errors.add(:end_date, 'cannot be before the start date.')
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

