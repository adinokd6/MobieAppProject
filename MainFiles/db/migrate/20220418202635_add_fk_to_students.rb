class AddFkToStudents < ActiveRecord::Migration[7.0]
  def change
    add_foreign_key :students, :class_lists
  end
end
