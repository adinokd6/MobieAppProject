class CreateEmployers < ActiveRecord::Migration[5.2]
  def change
    create_table :employers do |t|
      t.string :EmployerId
      t.string :EmailId
      t.references :email, foreign_key: true

      t.timestamps
    end
  end
end
