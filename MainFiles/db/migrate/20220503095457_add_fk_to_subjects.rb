class AddFkToSubjects < ActiveRecord::Migration[7.0]
  def change
    add_reference :subjects, :teacher
    add_reference :subjects, :trainer
    add_reference :subjects, :class_type
    add_foreign_key :subjects, :teachers, column: :teacher_id
    add_foreign_key :subjects, :trainers, column: :trainer_id
    add_foreign_key :subjects, :class_types, column: :class_type_id
  end
end
