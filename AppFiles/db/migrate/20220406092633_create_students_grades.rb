class CreateStudentsGrades < ActiveRecord::Migration[5.2]
  def change
    create_table :students_grades, id: false do |t|
      t.belongs_to :student, index: true
      t.belongs_to :grade, index: true
    end
  end
end
