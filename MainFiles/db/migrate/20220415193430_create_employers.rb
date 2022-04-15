class CreateEmployers < ActiveRecord::Migration[5.2]
  def change
    create_table :employers do |t|
      t.integer :EmployerId
      t.integer :EmailId
      t.references :email, foreign_key: true

      t.timestamps
    end
  end
end
