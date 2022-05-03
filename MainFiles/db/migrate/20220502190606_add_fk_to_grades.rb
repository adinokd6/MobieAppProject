class AddFkToGrades < ActiveRecord::Migration[7.0]
  def change
    add_reference :grades, :student
    add_reference :grades, :subject
    add_foreign_key :grades, :students, column: :student_id
    add_foreign_key :grades, :subjects, columnt: :subject_id
  end
end
