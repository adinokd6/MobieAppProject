class AddIndexToStudentsIndex < ActiveRecord::Migration[7.0]
    def change
      add_index :students, :StudentId, unique: true
    end
end
