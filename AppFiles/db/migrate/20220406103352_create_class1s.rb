class CreateClass1s < ActiveRecord::Migration[5.2]
  def change
    create_table :class1s do |t|
      t.string :ClassId
      t.string :Period
      t.string :Time
      t.references :animal, foreign_key: true

      t.timestamps
    end
  end
end
