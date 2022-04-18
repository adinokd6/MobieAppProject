class AddStudentToGrades < ActiveRecord::Migration[7.0]
  def change
    add_reference :grades, :student
  end
end
