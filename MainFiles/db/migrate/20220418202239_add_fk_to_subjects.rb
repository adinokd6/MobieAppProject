class AddFkToSubjects < ActiveRecord::Migration[7.0]
  def change
    add_foreign_key :subjects, :teachers
  end
end
