class AddFkToSubjects2 < ActiveRecord::Migration[7.0]
  def change
    add_foreign_key :subjects, :trainers
  end
end
