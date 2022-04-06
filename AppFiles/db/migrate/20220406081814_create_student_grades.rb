class CreateStudentGrades < ActiveRecord::Migration[5.2]
  def change
    create_table :student_grades, id:false do |t|
      t.belongs_to :student, index: true
      t.belongs_to :grades, index: true
    end
  end
end
