class AddPasswordToTeacherAndTrainer < ActiveRecord::Migration[7.0]
  def change
    add_column :teachers, :password_digest, :string
    add_column :teachers, :token, :string

    add_column :trainers, :password_digest, :string
    add_column :trainers, :token, :string

    add_index :teachers, :TeacherId, unique: true
    add_index :teachers, :token

    add_index :trainers, :TrainerId, unique: true
    add_index :trainers, :token
  end
end
