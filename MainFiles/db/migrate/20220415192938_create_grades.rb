class CreateGrades < ActiveRecord::Migration[5.2]
  def change
    create_table :grades do |t|
      t.integer :GradeId
      t.integer :Grade
      t.string :Date
      t.timestamps
    end
  end
end
