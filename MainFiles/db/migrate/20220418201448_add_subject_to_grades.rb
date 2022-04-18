class AddSubjectToGrades < ActiveRecord::Migration[7.0]
  def change
    add_reference :grades, :subject
  end
end
