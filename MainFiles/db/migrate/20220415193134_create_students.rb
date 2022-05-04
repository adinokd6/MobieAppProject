class CreateStudents < ActiveRecord::Migration[5.2]
  def change
    create_table :students do |t|
      t.integer :StudentId
      t.string :FirstName
      t.string :SecondName
      t.string :DateOfBirth

      t.timestamps
    end
  end
end
