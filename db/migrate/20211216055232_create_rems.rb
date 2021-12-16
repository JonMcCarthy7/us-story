class CreateRems < ActiveRecord::Migration[6.1]
  def change
    create_table :rems do |t|
      t.string :content
      t.references :user, index: true, foreign_key: true
      t.references :entry, index: true, foreign_key: true

      t.timestamps
    end
  end
end
