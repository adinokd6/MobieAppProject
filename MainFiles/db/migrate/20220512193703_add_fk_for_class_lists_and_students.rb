class AddFkForClassListsAndStudents < ActiveRecord::Migration[7.0]
  def change
    add_reference :students, :class_list, index: true
    add_foreign_key :students, :class_lists
  end
end
