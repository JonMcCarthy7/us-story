class AddEventReferenceToEvent < ActiveRecord::Migration[6.1]
  def change
    add_reference :events, :event, index: true, foreign_key: true
  end
end
