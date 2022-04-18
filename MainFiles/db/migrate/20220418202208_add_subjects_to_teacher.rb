class AddSubjectsToTeacher < ActiveRecord::Migration[7.0]
  def change
    add_reference :subjects, :teacher
  end
end
