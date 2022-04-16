class CreateAnimalClass < ActiveRecord::Migration[7.0]
  def change
    create_table :animal_classes, id: false do |t|
            t.belongs_to :animal, index: true
            t.belongs_to :class_type, index: true
    end
  end
end
