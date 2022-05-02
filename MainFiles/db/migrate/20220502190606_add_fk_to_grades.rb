class AddFkToGrades < ActiveRecord::Migration[7.0]
  def change
    add_reference :grades, :student, index: true
    add_reference :grades, :subject, index: true
    add_foreign_key :grades, :students
    add_foreign_key :grades, :subjects
  end
end
