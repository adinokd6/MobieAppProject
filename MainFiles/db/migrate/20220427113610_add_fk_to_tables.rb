class AddFkToTables < ActiveRecord::Migration[7.0]
  def change
    add_reference :certificates, :student, index: true
    add_foreign_key :certificates, :students
  end
end
