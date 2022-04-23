class CreateEmployees < ActiveRecord::Migration[7.0]
  def change
    create_table :employees do |t|
      t.integer :EmployeeId
      t.integer :EmailId
      t.references :email, foreign_key: true

      t.timestamps
    end
  end
end
