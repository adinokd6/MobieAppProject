class CreateGrades < ActiveRecord::Migration[5.2]
  def change
    create_table :grades do |t|
      t.string :StudentId
      t.string :SubjectId
      t.string :Grade
      t.string :Date

      t.timestamps
    end
  end
end
