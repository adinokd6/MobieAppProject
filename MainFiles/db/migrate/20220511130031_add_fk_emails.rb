class AddFkEmails < ActiveRecord::Migration[7.0]
  def change
    add_reference :emails, :employee, index: true
    add_foreign_key :emails, :employees

    add_reference :emails, :student, index: true
    add_foreign_key :emails ,:students
  end
end
