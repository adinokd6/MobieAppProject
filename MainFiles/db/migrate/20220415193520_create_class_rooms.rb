class CreateClassRooms < ActiveRecord::Migration[5.2]
  def change
    create_table :class_rooms do |t|
      t.integer :ClassRoomId
      t.integer :RoomNumber
      t.integer :Capacity
      t.string :RoomType
      t.string :Facilities

      t.timestamps
    end
  end
end
