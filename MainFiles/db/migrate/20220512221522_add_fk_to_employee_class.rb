class AddFkToEmployeeClass < ActiveRecord::Migration[7.0]
  def change
    add_reference :employees, :class_type, index: true
    add_foreign_key :employees, :class_types
  end
end
