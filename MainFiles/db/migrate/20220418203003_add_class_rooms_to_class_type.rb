class AddClassRoomsToClassType < ActiveRecord::Migration[7.0]
  def change
    add_reference :class_rooms, :class_type
  end
end
