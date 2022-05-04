class AddFkForEmployeeTeachers < ActiveRecord::Migration[7.0]
    def change
      add_reference :teachers, :employee, index: true
      add_foreign_key :teachers, :employees

      add_reference :trainers, :employee, index: true
      add_foreign_key :trainers, :employees
    end
end
