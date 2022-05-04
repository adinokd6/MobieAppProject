class AddTokenToStudents < ActiveRecord::Migration[7.0]
  def change
    add_column :students, :token, :string
    add_index :students, :token
  end
end
