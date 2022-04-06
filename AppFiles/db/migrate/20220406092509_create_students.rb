class CreateStudents < ActiveRecord::Migration[5.2]
  def change
    create_table :students do |t|
      t.string :StudentId
      t.string :FirstName
      t.string :SecondName
      t.string :SchoolTeam
      t.string :DateOfBirth
      t.string :Points
      t.string :Attendance

      t.timestamps
    end
  end
end
