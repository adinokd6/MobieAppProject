class CreateTrainers < ActiveRecord::Migration[5.2]
  def change
    create_table :trainers do |t|
      t.integer :TrainerId
      t.string :FirstName
      t.string :LastName

      t.timestamps
    end
  end
end
