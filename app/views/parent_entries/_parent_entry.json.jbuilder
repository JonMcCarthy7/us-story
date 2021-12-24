json.extract! parent_entry, :id, :title, :description, :start_date, :end_date, :entry_type, :type, :status, :user_id, :relationship_id, :entry_id, :created_at, :updated_at
json.url entry_url(parent_entry, format: :json)
