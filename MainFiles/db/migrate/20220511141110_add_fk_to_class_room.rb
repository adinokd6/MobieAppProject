class AddFkToClassRoom < ActiveRecord::Migration[7.0]
  def change
    add_reference :class_rooms, :class_type, index: true
    add_foreign_key :class_rooms, :class_types
  end
end
