class CreateStudents < ActiveRecord::Migration[5.2]
  def change
    create_table :students do |t|
      t.integer :StudentId
      t.string :FirstName
      t.string :SecondName
      t.string :DateOfBirth
      t.references :grade, foreign_key: true
      
      t.timestamps
    end
  end
end
