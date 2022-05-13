class CreateAnimalClass < ActiveRecord::Migration[7.0]
  def change
    create_table :animals_classes, id: false do |t|
            t.belongs_to :animal
            t.belongs_to :class_type
    end
  end
end
