class CreateTeachers < ActiveRecord::Migration[5.2]
  def change
    create_table :teachers do |t|
      t.string :TeacherId
      t.string :FirstName
      t.string :LastName
      t.string :Title

      t.timestamps
    end
  end
end
