class ChildEntry < Entry
  belongs_to :parent_entry, foreign_key: :entry_id

  validate :date_within_parent_entry

  private

  def date_within_parent_entry
    return if (parent_entry.start_date..parent_entry.end_date).cover? start_date

    errors.add(:start_date, "has to be within it's trips start and end date.")
  end
end
