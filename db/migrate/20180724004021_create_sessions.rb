class CreateSessions < ActiveRecord::Migration[5.2]
  def change
    create_table :sessions do |t|
      t.string :day
      t.string :time
      t.references :room, foreign_key: true
      t.references :speaker, foreign_key: true
      t.integer :primary_category_id
      t.integer :secondary_category_id
      t.references :level, foreign_key: true
      t.string :title
      t.text :description

      t.timestamps
    end
  end
end
