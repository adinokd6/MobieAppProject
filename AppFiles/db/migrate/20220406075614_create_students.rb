class CreateStudents < ActiveRecord::Migration[5.2]
  def change
    create_table :students do |t|
      t.string :Studentd
      t.string :name
      t.string :FirstName
      t.string :SecondName
      t.string :SchoolTeam
      t.string :DateOfBirth
      t.string :Points
      t.string :Attendance
      t.string :EmailId

      t.timestamps
    end
  end
end
