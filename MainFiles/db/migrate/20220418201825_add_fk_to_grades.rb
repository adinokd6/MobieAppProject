class AddFkToGrades < ActiveRecord::Migration[7.0]
  def change
    add_foreign_key :grades, :students
  end
end
