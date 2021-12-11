class CreateRelationships < ActiveRecord::Migration[6.1]
  def change
    create_table :relationships do |t|
      t.string :title
      t.text :description
      t.date :start_date
      t.string :type

      t.timestamps
    end
  end
end
