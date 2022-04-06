class CreateAnimals < ActiveRecord::Migration[5.2]
  def change
    create_table :animals do |t|
      t.string :AnimalId
      t.string :Species
      t.string :Gender
      t.string :IsAlive
      t.string :Name

      t.timestamps
    end
  end
end
