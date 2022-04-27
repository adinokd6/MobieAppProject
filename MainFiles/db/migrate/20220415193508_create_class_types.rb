class CreateClassTypes < ActiveRecord::Migration[5.2]
  def change
    create_table :class_types do |t|
      t.integer :ClassId
      t.string :Period
      t.string :Time

      t.timestamps
    end
  end
end
