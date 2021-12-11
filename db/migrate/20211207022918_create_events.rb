class CreateEvents < ActiveRecord::Migration[6.1]
  def change
    create_table :events do |t|
      t.string :title
      t.text :description
      t.date :start_date
      t.date :end_date
      t.string :status
      t.references :user, index: true, foreign_key: true
      t.references :relationship, index: true, foreign_key: true
      t.string :event_type, index: true

      t.timestamps
    end
  end
end
