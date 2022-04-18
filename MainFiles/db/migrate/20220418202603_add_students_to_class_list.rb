class AddStudentsToClassList < ActiveRecord::Migration[7.0]
  def change
    add_reference :students, :class_list
  end
end
