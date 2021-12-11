json.extract! event, :id, :title, :description, :start_date, :end_date, :event_type, :status, :user_id, :relationship_id, :event_id_id, :created_at, :updated_at
json.url event_url(event, format: :json)
