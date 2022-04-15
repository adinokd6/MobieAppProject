class CreateAnimals < ActiveRecord::Migration[5.2]
  def change
    create_table :animals do |t|
      t.integer :AnimalId
      t.string :Species
      t.string :Gender
      t.boolean :IsAlive
      t.string :Name

      t.timestamps
    end
  end
end
