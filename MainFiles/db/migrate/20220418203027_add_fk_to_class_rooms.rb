class AddFkToClassRooms < ActiveRecord::Migration[7.0]
  def change
    add_foreign_key :class_rooms, :class_types
  end
end
