class CreateClassTypes < ActiveRecord::Migration[5.2]
  def change
    create_table :class_types do |t|
      t.integer :ClassId
      t.string :Period
      t.string :Time
      t.references :animal, foreign_key: true

      t.timestamps
    end
  end
end
