class CreateSubjects < ActiveRecord::Migration[5.2]
  def change
    create_table :subjects do |t|
      t.integer :SubjectId
      t.text :Description
      t.integer :MaxCapacity

      t.timestamps
    end
  end
end
