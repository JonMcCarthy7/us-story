class CreateEntries < ActiveRecord::Migration[6.1]
  def change
    create_table :entries do |t|
      t.string :title
      t.text :description
      t.date :start_date
      t.date :end_date
      t.string :event_type
      t.string :type
      t.string :status
      t.references :user, index: true, foreign_key: true
      t.references :relationship, index: true, foreign_key: true
      t.references :entry, index: true, foreign_key: true

      t.timestamps
    end
  end
end
